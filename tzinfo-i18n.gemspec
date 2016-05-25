# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tzinfo/i18n/version'

Gem::Specification.new do |spec|
  spec.name          = 'tzinfo-i18n'
  spec.version       = TZInfo::I18n::VERSION
  spec.authors       = ['getaroom']
  spec.email         = ['devteam@roomvaluesteam.com']

  spec.summary       = 'I18n data for TZInfo'
  spec.description   = 'Extends TZInfo with I18n data'
  spec.homepage      = 'http://www.github.com/getaroom/tzinfo-i18n'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either
  # set the 'allowed_push_host' to allow pushing to a single host
  # or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0+ is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'i18n'
  spec.add_dependency 'tzinfo', '~> 0.3'
  spec.add_dependency 'tzinfo-data'

  spec.add_development_dependency 'bundler',  '~> 1.12'
  spec.add_development_dependency 'rake',     '~> 10.0'
  spec.add_development_dependency 'rspec',    '~> 3.0'
  spec.add_development_dependency 'rubocop',  '~>0.35'
end
