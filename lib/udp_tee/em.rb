class UdpTee::Em

  Defaults = {
    # reserved for future use..
    tic: 10
  }

  def initialize fan_out, config = {}
    @config = Defaults.merge(config)
    @fan_out = fan_out
  end

  # alias to #forever
  def self.start(fan_out, config = {}); new(fan_out, config).forever; end

  # starting up the the eventmachine server loop which basically runs forever
  def forever 
    puts " -- starting fan-out loop (#{@fan_out.inspect})"
    EM.run do
      if tic_dt = @config[:tic]
        @timer = EventMachine::PeriodicTimer.new(Integer(tic_dt)) { tic }
      end

      # forward incoming UDP packets to the fan-out input
      i = @fan_out.input
      puts " -- open input: #{i.ip}:#{i.port}"
      EM.open_datagram_socket(i.ip, i.port, UdpTee::Connection) do |c|
        c.on_receive {|message| i.receive(message)}
      end

      # install listener on fan-out outputs and forward to EM udp mechanism
      @fan_out.outputs.each do |o|
        puts " -- open output: #{o.ip}:#{o.port}"
        EM.open_datagram_socket('0.0.0.0', 0, UdpTee::Connection) do |c|
          o.on_push {|dst, msg| c.send_datagram(msg, dst.ip, dst.port)}
        end
      end
    end
  end

  private 

  def tic
    puts " -- time is #{Time.now}"
    # @timer.cancel if (n+=1) > 5
  end

  # as long there is no GUI for creating fan-out settings we create a fan-out
  # instance on the fly from the first input found to all existing outputs.
  #
  def load_fan_out
    fan_out = FanOut.first
    fan_out ||= FanOut.create(
      input: Input.first,
      outputs: Output.all,
    ).activate
    #fan_out.activate
  end
end
