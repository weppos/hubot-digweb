chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'dnsimple', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/digweb')(@robot)

  it 'registers a hear listener for "dig (.*)"', ->
    expect(@robot.hear).to.have.been.calledWith(/dig (.*)$/i)
