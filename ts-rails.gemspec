lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'typescript/rails/version'

Gem::Specification.new do |gem|
  gem.name          = 'ts-rails'
  gem.version       = TypeScript::Rails::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ['Valentin Vasilyev']
  gem.email         = %w(valentin.vasilyev@outlook.com)
  gem.description   = %q{Adds TypeScript to the Rails Asset pipeline}
  gem.summary       = %q{Adds TypeScript to the Rails Asset pipeline}
  gem.homepage      = 'https://github.com/valve/ts-rails'

  gem.add_runtime_dependency 'tsc-ruby'
  gem.add_runtime_dependency 'tilt'
  gem.add_runtime_dependency 'railties'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.0.0'
end
