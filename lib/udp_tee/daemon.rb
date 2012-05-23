class UdpTee::Daemon

  Defaults = {
    # reserved for future use..
  }

  def self.env
    puts ENV.map{|h|h * ' --> '}.sort * "\n"
    puts "options: #{new.options}"
  end

  attr_reader :inputs, :options

  def initialize
    # this is pulling options from the evnironment. Expected format:
    #
    #   UDP_TEE_ARGS="--action=env --env=production --pidfile=xxx"
    #
    # into:
    #
    #   {:action=>"env", :env=>"production", :pidfile=>"xxx", :args=>[]}
    #
    @options = Defaults.merge(env_args)

    if @options[:pidfile]
      File.open(@options[:pidfile], "w") {|f| f.write Process.pid}
    end
  end

  def env_args 
    @env_args ||= Hash.from_argv((ENV['UDP_TEE_ARGS'] || '').split ' ')
  end

  # alias to #forever
  def self.start; new.forever; end

  # starting up the the eventmachine server loop which basically runs forever
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

  # as long there is no GUI for creating fan-out settings we create a fan-out
  # instance on the fly from the first input found to all existing outputs.
  #
  def create_fan_out_from_inputs_and_outputs
    fan_out = FanOut.first
    fan_out ||= FanOut.create(
      input: Input.first,
      outputs: Output.all,
    ).activate
    #fan_out.activate
  end
end
