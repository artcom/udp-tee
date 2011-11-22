class UdpTee::Joint

  attr_reader :inputs 

  def initialize
    @inputs = []
  end

  # starting up the the eventmachine server loop which basically runs forever
  def self.start; new.forever; end

  def forever # endless server loop
    EM.run do
      open_inputs
    end
  end

  def open_inputs
    puts "opening inputs"
    Input.all.map {|desc| IncommingUdp.open(self, desc)}
  end

  def handle_incoming data
    puts "incoming(#{data.size}"
  end

  module IncommingUdp
    def initialize
      puts "new input: #{self}"
    end

    def self.open joint, desc
      EM.open_datagram_socket('0.0.0.0', desc.port, IncommingUdp) do |incoming|
        joint.inputs << incoming
        incoming.on_receive {|data| joint.handle_incoming(data)}
      end
    end
 
    def on_receive &on_receive_cb
      @on_receive_cb = on_receive_cb
    end

    # EM#connection callback invoked on incoming datagrams..
    def receive_data data
      @on_receive_cb.call(data)
    end
  end
end
