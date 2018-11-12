#!/usr/bin/env ruby
require 'rainbow'

userInput = ARGV.join(' ')

expecs = [
  {'red' => 'yellow'},
  {'green' => 'blue'}
]

_return = []

expecs.each do |expec|
  pattern, color = expec.to_a.first
  if Regexp.new(pattern) =~ userInput
    userInput.gsub! pattern, Rainbow(pattern).send(color)
  end
end

puts userInput


