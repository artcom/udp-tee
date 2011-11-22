class UdpTee::Daemon

  attr_reader :inputs 

  # starting up the the eventmachine server loop which basically runs forever
  def self.start; new.forever; end

  # endless server loop
  def forever 
    fo = create_fan_out_from_inputs_and_outputs
    EM.run do
      open_input fo.input
      open_outputs fo.outputs
    end
  end

  # open UDP socket on input and connect with daemon instance
  def open_input input
    EM.open_datagram_socket(input.ip, input.port, UdpTee::Connection) do |c|
      c.on_receive {|data| input.push(data)}
    end
  end

  def open_outputs outputs
    outputs.each {|output| open_output output}
  end
  def open_output output
    EM.open_datagram_socket('0.0.0.0', 0, UdpTee::Connection) do |c|
      output.on_fire {|data| c.send_datagram data, output.ip, output.port}
    end
  end

  def create_fan_out_from_inputs_and_outputs
    fan_out = FanOut.new # TODO only one fan-out currently...
    fan_out.input = Input.first
    fan_out.outputs = Output.all
    fan_out.save!
    fan_out.activate
  end
end
