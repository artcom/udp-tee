require 'spec_helper'

describe "fan_outs/edit" do
  before(:each) do
    @fo = assign(:fan_out, stub_model(FanOut,
      :nick => "MyString",
      :input => SocketConnector.new(:port => 4321),
    ))
  end

  it "renders the edit fan_out form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fan_outs_path(@fo), :method => "post" do
      assert_select "input#fan_out_nick", :name => "fan_out[nick]"
      #assert_select "input#fan_out_input_id", :name => "fan_out[input_id]"
      #assert_select "input#socket_connector_port", :name => "fan_out[port]"
    end
  end
end
