#!/usr/bin/env ruby

require 'rubygems'
require 'applix'

Defaults = {
  env:    :production,
  action: :start,
}

def usage 
  puts <<-EOT

#{__FILE__} [--pidfile=pid] [--logfile=t] [--background]

  EOT
  exit 0
end

# examples usage: 
#
#   ./script/udp-tee.rb --pidfile=pid --logfile=t --background
#
Applix.main(ARGV, Defaults) do

  any do |*args, opts|
    (opts[:help] or opts[:h]) and usage
    
    #puts "args: #{args}"
    #puts "options: #{opts}"
    script = File.expand_path('../../script/rails', __FILE__)
    ENV['UDP_TEE_ARGS'] = opts.map{|h| "--%s=%s" % h}.sort * ' '
    cmd = "#{script} runner -e #{opts[:env]} UdpTee::Daemon.#{opts[:action]}"

    if opts[:logfile]
      cmd = "#{cmd} >> #{opts[:logfile]} 2>&1"
    end

    if opts[:background]
      cmd = "#{cmd} &"
    end

    puts "executing: #{cmd}"
    system cmd
  end
end
