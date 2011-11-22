class Output < ActiveRecord::Base
  include UdpTee::Node
  belongs_to :fan_out

  def to_s
    "#{ip}:#{port}"
  end
end
