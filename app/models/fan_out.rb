class FanOut < ActiveRecord::Base
  has_one :input
  has_many :outputs

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
