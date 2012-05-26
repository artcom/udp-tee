require 'spec_helper'

describe SocketConnector do
  context 'with empty SocketConnector' do
    let(:so) { SocketConnector.new }

    it 'supports the habtm assoc' do
      so.fan_outs.should eq([])
    end

    it 'should not crash on_push' do
      expect { so.push 'abx' }.should_not raise_error
    end

    it 'executes on_push callback' do
      called = false
      so.on_push do |p, msg|
        p.should be(so)
        msg.should eq('abx')
        called = true
      end
      so.push 'abx'
      called.should be(true)
    end

    it 'should not crash on_receive' do
      expect { so.receive 'abx' }.should_not raise_error
    end

    it 'executes on_receive callback' do
      called = false
      so.on_receive do |p, msg|
        p.should be(so)
        msg.should eq('x23')
        called = true
      end
      so.receive 'x23'
      called.should be(true)
    end
  end
end
