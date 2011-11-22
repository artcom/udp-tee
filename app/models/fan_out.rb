class FanOut < ActiveRecord::Base
  has_one :input
  has_many :outputs

  after_find  :activate

  def activate
    puts "activating input: #{input}"
    input or return
    input.on_fire do |data| 
      puts "input fire"
      outputs.each do |output|
        output.push(data)
      end
    end
    self
  end
end
