require "rubygems"
require "bundler/setup"

# require your gems as usual
require "eventmachine"

class UdpTeeTestSource

  attr_accessor :out 

  def initialize ip, port
    @ip, @port = ip, port
    @out = nil
  end

  def tic
    message = "the time is #{Time.now}\n"
    @out or return
    @out.send_datagram message, @ip, @port 
    puts message
  end

  def forever # endless server loop
    EM.run do
      EventMachine::PeriodicTimer.new(1) { tic }

      controller = self
      EM.open_datagram_socket('0.0.0.0', 0, Connection) do |c|
        controller.out = c
        c.on_receive {|data| controller.receive_data(data)}
      end
    end
  end

  module Connection
    def on_receive &blk;
      @on_recieve = blk
    end
    # EM#connection callback invoked on incoming datagrams..
    def receive_data data
      blk.call(data)
    end
  end
end

ip = ARGV.shift
port = ARGV.shift
UdpTeeTestSource.new(ip, port).forever

__END__

  def push scopes, messages
    puts " -- to scopes(#{messages.size}): #{scopes.join ', '}"
    scopes.each do |scope|
      messages.each do |message| 
        #puts ">>>>#{message}"
        send_datagram message, scope.ip, scope.port 
      end
    end
  end
