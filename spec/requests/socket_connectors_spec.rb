require 'spec_helper'

describe "SocketConnector" do
  describe "GET /socket_connectors" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get socket_connectors_path
      response.status.should be(200)
    end
  end
end
