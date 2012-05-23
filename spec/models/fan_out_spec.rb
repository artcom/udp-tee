require 'spec_helper'

describe FanOut do
  context 'with input & output' do
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
