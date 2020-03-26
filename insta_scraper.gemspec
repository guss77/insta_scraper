# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'insta_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = 'insta_scraper'
  spec.version       = InstaScraper::VERSION
  spec.authors       = ['preciz']

  spec.summary       = 'Scrapes Instagram accounts'
  spec.description   = 'Scrapes Instagram accounts public data'
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'hashie', ['>= 3.4.6', '< 3.6.0']
  spec.add_dependency 'faraday', '>= 1.0'
  spec.add_dependency 'faraday-cookie_jar', '0.0.6'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
