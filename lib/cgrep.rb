require 'rainbow'
require 'optparse'

@options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: --pattern PATTERN:COLOR [text]'

  opts
    .on('-p', '--pattern PATTERN:COLOR', 'Pattern and respective color') do |p|
      @options[:patterns] ||= []
      key, value = p.split(':')
      @options[:patterns] << { key => value }
    end

  opts.on('-i', '--input', 'Standard input') do |i|
    @options[:stdInput] = i
  end
end.parse!

def colorize(user_input)
  expecs = @options[:patterns]

  _return = []

  expecs.each do |expec|
    pattern, color = expec.to_a.first
    if (match = user_input.match(Regexp.new(pattern)))
      user_input.gsub! match.to_s, Rainbow(match).send(color)
    end
  end

  user_input
end

if @options[:stdInput]
  while (line = $stdin.gets)
    puts colorize(line)
  end
else
  puts colorize(ARGV.join(' '))
end
