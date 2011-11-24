# glueing EM to us
module UdpTee::Connection
  def on_receive &blk;
    @on_receive = blk
  end

  # EM#connection callback invoked on incoming datagrams..
  def receive_data data
    if @on_receive
      @on_receive.call(data)
    else
      puts "received into the void: '#{data}'"
    end
  end
end
