require 'spec_helper'

describe SocketConnector do
  context 'with empty port' do
    let(:port) { SocketConnector.new }
    it 'should not crash on_push' do
      expect { port.push 'abx' }.should_not raise_error
    end

    it 'executes on_push callback' do
      called = false
      port.on_push do |p, msg|
        p.should be(port)
        msg.should eq('abx')
        called = true
      end
      port.push 'abx'
      called.should be(true)
    end

    it 'should not crash on_receive' do
      expect { port.receive 'abx' }.should_not raise_error
    end

    it 'executes on_receive callback' do
      called = false
      port.on_receive do |p, msg|
        p.should be(port)
        msg.should eq('x23')
        called = true
      end
      port.receive 'x23'
      called.should be(true)
    end
  end
end
