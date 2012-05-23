class FanOut < ActiveRecord::Base
  belongs_to :input, :class_name => SocketConnector
  has_and_belongs_to_many :outputs, :class_name => SocketConnector

  attr_accessible :nick, :input_id, :output_ids, :open
  after_find  :activate
  after_commit  :activate

  private
  def activate
    puts "activating input: #{input}"
    input or return
    input.on_receive do |sock, data| 
      puts "(#{data.size}) bytes to #{outputs.size} outputs"
      outputs.each {|output| output.push(data)}
    end
    self
  end
end
