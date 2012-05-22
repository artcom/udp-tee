require 'spec_helper'

describe "socket_connectors/show" do
  before(:each) do
    @socket_connector = assign(:socket_connector, stub_model(SocketConnector,
      :nick => "Nick",
      :ip => "IP",
      :port => 9999,
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nick/)
    rendered.should match(/IP/)
    rendered.should match(/9999/)
  end
end
