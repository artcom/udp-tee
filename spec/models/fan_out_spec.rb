require 'spec_helper'

describe FanOut do

  context 'with fo from fixture' do
    fixtures :fan_outs, :socket_connectors
    let(:fo) { fan_outs(:one) }
    it 'loads fixtues with habtm outputs' do
      fo.should be
      fo.input.should be
      fo.outputs.should eq([socket_connectors(:out1)])
    end

    it 'behaves strange on connection de-referencing' do
      # XXX: for some weird rails meta magic it is that:
      #
      #   outputs[0] != outputs.first 
      #
      # because of that the next line will fail!!!
      #
      expect{ fo.outputs.first.should be(fo.outputs[0]) }.should raise_error

      # but once you've pulled [0] once, ...
      fo.outputs[0].should_not be(nil)

      # ... it suddenly works???
      fo.outputs.first.should be(fo.outputs[0])
    end

    it 'connects input to output on load from database(fixture)' do
      count = 0

      # XXX: understand test above to understand outputs[0] vs outputs.first...
      fo.outputs[0].on_push {count += 1}

      # pushing a message to the fan input results in the out callback 
      fo.input.receive %(whatever, 'cause we're NOT testing the message here)
      count.should be(1)
    end
  end

  context 'with input & output' do
    let(:i) { SocketConnector.new port: 1234 }
    let(:o) { SocketConnector.new port: 4321 }
    let(:fo) { FanOut.new.tap{|fo| fo.input = i; fo.outputs = [o]} }

    it '(re)connects input to output on save' do
      called = false
      message = 'hi there!'
      o.on_push do |connector, m|
        connector.should eq(o)
        m.should eq(message)
        called = true
      end
      i.receive(message)
      called.should be(false)

      fo.save
      i.receive(message)
      called.should be(true)
    end
  end

  context 'with new fan-out' do
    let(:fo) { FanOut.new }
    it 'defaults to be open' do
      fo.open.should be(true)
    end

    #it 'can be activated' do
    #  expect { fo.activate }.should_not raise_error
    #end
  end
end
