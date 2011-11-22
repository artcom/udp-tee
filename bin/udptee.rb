require 'rubygems'
require 'bundler/setup'

require 'eventmachine'

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'udp_tee'

UdpTee::FanOut.start

__END__

  def push scopes, messages
    puts " -- to scopes(#{messages.size}): #{scopes.join ', '}"
    scopes.each do |scope|
      messages.each do |message| 
        #puts ">>>>#{message}"
        send_datagram message, scope.ip, scope.port 
      end
    end
  end
