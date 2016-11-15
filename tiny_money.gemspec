# coding: utf-8
# frozen_literal_string: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tiny_money/version'

Gem::Specification.new do |spec|
  spec.name          = 'tiny_money'
  spec.version       = TinyMoney::VERSION
  spec.authors       = ['Ronualdo Maciel']
  spec.email         = ['raxmac@gmail.com']

  spec.summary       = 'A tiny type to represent money values.'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
