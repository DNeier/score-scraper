# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'score_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = "score-scraper"
  spec.version       = ScoreScraper::VERSION
  spec.authors       = ["Derrick Neier"]
  spec.email         = ["derrick.neier@gmail.com"]

  spec.summary       = %q{Retrieve NBA and MLB scores.}
  spec.homepage      = "https://github.com/DNeier/score-scraper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

	spec.add_runtime_dependency "json", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
