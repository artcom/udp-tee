class FanOut < ActiveRecord::Base
  has_one :input, :class_name => SocketConnector
  #has_many :outputs, :class_name => SocketConnector

  after_find  :activate

  def activate
    puts "activating input: #{input}"
    input or return
    input.on_fire do |data| 
      puts "(#{data.size}) bytes to #{outputs.size} outputs"
      outputs.each {|output| output.push(data)}
    end
    self
  end
end
