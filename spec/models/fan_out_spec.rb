require 'spec_helper'

describe FanOut do
  context 'with new fan-out' do
    let(:fo) { FanOut.new }
    it 'can be activated' do
      expect { fo.activate }.should_not raise_error
    end
  end
end
