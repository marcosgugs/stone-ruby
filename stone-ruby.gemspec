# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'stone/version'

Gem::Specification.new do |spec|
  spec.name          = 'stone-ruby'
  spec.version       = Stone::VERSION
  spec.authors       = ['Marcos Junior']
  spec.email         = ['marcos.junior@rhsoftware.com.br']

  spec.summary       = 'API Wrapper for Stone Payments'
  spec.description   = 'API Wrapper for Stone Payments'
  spec.homepage      = 'https://github.com/marcosgugs/stone-ruby'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #
  #   spec.metadata['homepage_uri'] = spec.homepage
  #   spec.metadata['source_code_uri'] = "TODO: Put your gem's public repo URL here."
  #   spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against ' \
  #     'public gem pushes.'
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-configurable', '~> 0.8.3'
  spec.add_dependency 'dry-struct', '~> 0.7'
  spec.add_dependency 'typhoeus', '~> 1.0.2'
  spec.add_dependency 'activesupport', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '0.80.1'
end
