# Description:
#   Like DiG, but in HTTP flavour
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_DIGWEB_HOST
#
# Commands:
#   dig <args> - returns the result of the dig query
#
# Author:
#   @weppos

digwebHost = process.env.HUBOT_DIGWEB_HOST || "https://digweb.herokuapp.com"

module.exports = (robot) ->
  robot.hear /^dig (.+)$/i, (msg) ->
    data = msg.match[1]
    msg.http("#{digwebHost}/")
      .headers("User-Agent": "hubot-digweb")
      .post(data) (err, res, body) ->
        switch res.statusCode
          when 200
            msg.send body
          when 400
            msg.send body
          when 520
            msg.send body
          else
            msg.send "Something strange happened!\n#{body}"
