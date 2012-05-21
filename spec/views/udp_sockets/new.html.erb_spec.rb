require 'spec_helper'

describe "udp_sockets/new" do
  before(:each) do
    assign(:udp_socket, stub_model(UdpSocket,
      :nick => "MyString",
      :ip => "MyString",
      :port => "9.99"
    ).as_new_record)
  end

  it "renders new udp_socket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => udp_sockets_path, :method => "post" do
      assert_select "input#udp_socket_nick", :name => "udp_socket[nick]"
      assert_select "input#udp_socket_ip", :name => "udp_socket[ip]"
      assert_select "input#udp_socket_port", :name => "udp_socket[port]"
    end
  end
end
