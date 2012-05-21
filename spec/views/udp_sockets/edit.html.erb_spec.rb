require 'spec_helper'

describe "udp_sockets/edit" do
  before(:each) do
    @udp_socket = assign(:udp_socket, stub_model(UdpSocket,
      :nick => "MyString",
      :ip => "MyString",
      :port => "9.99"
    ))
  end

  it "renders the edit udp_socket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => udp_sockets_path(@udp_socket), :method => "post" do
      assert_select "input#udp_socket_nick", :name => "udp_socket[nick]"
      assert_select "input#udp_socket_ip", :name => "udp_socket[ip]"
      assert_select "input#udp_socket_port", :name => "udp_socket[port]"
    end
  end
end
