# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "cgrep"
  spec.version       = "0.1.0"
  spec.authors       = ["Alex Rocha"]
  spec.email         = ["alex.rochas@yahoo.com.br"]

  spec.summary       = "Colorized grep"
  spec.description   = "To grep and color input by pattern"
  spec.homepage      = "https://github.com/alexrochas/colorized-grep"
  spec.license       = "MIT"

  spec.bindir        = "exe"
  spec.executables   = "cgrep"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rainbow", "~> 3.0"
end
