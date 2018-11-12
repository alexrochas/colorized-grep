#!/usr/bin/env ruby
require 'rainbow'
require 'optparse'

@options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: --pattern PATTERN:COLOR [text]"

  opts.on("-p", "--pattern PATTERN:COLOR", "Pattern and respective color") do |p|
    @options[:patterns] ||= Array.new
    key, value = p.split(':')
    @options[:patterns] << {key => value}
  end

  opts.on("-i", "--input", "Standard input") do |i|
    @options[:stdInput] = i
  end
end.parse!

def colorize userInput
  expecs = @options[:patterns]

  _return = []

  expecs.each do |expec|
    pattern, color = expec.to_a.first
    if match = userInput.match(Regexp.new(pattern))
      userInput.gsub! match.to_s, Rainbow(match).send(color)
    end
  end

  userInput
end

if @options[:stdInput]
  while line = $stdin.gets
    puts colorize(line)
  end
else
  puts colorize(ARGV.join(' '))
end

