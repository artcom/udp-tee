require 'spec_helper'

describe "udp_sockets/index" do
  before(:each) do
    assign(:udp_sockets, [
      stub_model(UdpSocket,
        :nick => "Nick",
        :ip => "192.168.1.1",
        :port => 16779,
        :created_at => Time.now,
      ),
      stub_model(UdpSocket,
        :nick => "Nick",
        :ip => "192.168.1.1",
        :port => 1025,
        :created_at => Time.now,
      )
    ])
  end

  it "renders a list of udp_sockets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nick".to_s, :count => 2
    assert_select "tr>td", :text => "192.168.1.1", :count => 2
    assert_select "tr>td", :text => '1025', :count => 1
    assert_select "tr>td", :text => '16779', :count => 1
  end
end
