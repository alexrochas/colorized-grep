#!/usr/bin/env ruby
require 'rainbow'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: --pattern PATTERN:COLOR [text]"

  opts.on("-p", "--pattern PATTERN:COLOR", "Pattern and respective color") do |p|
    options[:patterns] ||= Array.new
    key, value = p.split(':')
    options[:patterns] << {key => value}
  end
end.parse!

userInput = ARGV.join(' ')

expecs = options[:patterns]

_return = []

expecs.each do |expec|
  pattern, color = expec.to_a.first
  if match = userInput.match(Regexp.new(pattern))
    userInput.gsub! match.to_s, Rainbow(match).send(color)
  end
end

puts userInput


