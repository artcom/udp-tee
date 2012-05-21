class UdpSocket < ActiveRecord::Base
  attr_accessible :ip, :nick, :port

  # note: would called this method #send but that kind of reserved in
  # ruby/rails
  def push message
    @on_push_callback && @on_push_callback.call(self, message)
  end

  def on_push &callback
    @on_push_callback = callback
  end

  def receive data
    @on_receive_callback && @on_receive_callback.call(self, data)
  end

  def on_receive &callback
    @on_receive_callback = callback
  end
end
