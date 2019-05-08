# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tzinfo/i18n/version'

Gem::Specification.new do |spec|
  spec.name          = 'tzinfo-i18n'
  spec.version       = TZInfo::I18n::VERSION.dup
  spec.authors       = ['getaroom']
  spec.email         = ['devteam@roomvaluesteam.com']

  spec.summary       = 'I18n data for TZInfo'
  spec.description   = 'Extends TZInfo with I18n data'
  spec.homepage      = 'http://www.github.com/getaroom/tzinfo-i18n'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4.0'

  spec.add_dependency 'i18n', '>= 0.7', '< 2'
  spec.add_dependency 'tzinfo', '>= 0.3', '< 3'

  spec.add_development_dependency 'appraisal', '~> 2.2'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec',     '~> 3.8'
  spec.add_development_dependency 'rubocop',   '~> 0.68.1'
end
