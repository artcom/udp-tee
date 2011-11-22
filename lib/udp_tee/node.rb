module UdpTee::Node
  def push data
    #puts "push #{self}: (#{data.size})"
    @on_fire_cb && @on_fire_cb.call(data)
  end

  def on_fire &blk
    #puts "on_fire #{self}"
    @on_fire_cb = blk
  end
end
