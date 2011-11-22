# glueing EM to us
module UdpTee::Connection
  def on_receive &blk;
    @on_receive = blk
  end
  # EM#connection callback invoked on incoming datagrams..
  def receive_data data
    @on_receive.call(data)
  end
end
