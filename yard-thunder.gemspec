require File.expand_path("../lib/yard-thunder/version", __FILE__)

Gem::Specification.new do |s|
  s.version     = YardThunder::VERSION

  s.name        = 'yard-thunder'
  s.summary     = "YARD integration for Thunder"
  s.description = "Integrates Thunder command line interfaces into YARD"

  s.authors     = ["Steven Karas"]
  s.email       = 'steven.karas@gmail.com'
  s.homepage    = 'http://stevenkaras.github.com/yard-thunder'

  s.files       =  []
  s.files       += Dir['lib/**/*.rb', 'spec/**/*.rb']
  s.files       += Dir['[A-Z]*', '[A-Z]*.*']
end