require 'spec_helper'

describe "socket_connectors/new" do
  before(:each) do
    assign(:socket_connector, stub_model(SocketConnector,
      :nick => "MyString",
      :ip => "MyString",
      :port => "9.99"
    ).as_new_record)
  end

  it "renders new socket_connector form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => socket_connectors_path, :method => "post" do
      assert_select "input#socket_connector_nick", :name => "socket_connector[nick]"
      assert_select "input#socket_connector_ip", :name => "socket_connector[ip]"
      assert_select "input#socket_connector_port", :name => "socket_connector[port]"
    end
  end
end
