# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ng_will_paginate/version'

Gem::Specification.new do |spec|
  spec.name          = "ng_will_paginate"
  spec.version       = NgWillPaginate::VERSION
  spec.authors       = ["Cheri Allen", "Utah Kate Newman", "Patrick Dent"]
  spec.email         = ["nirds@nird.us"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Allows you to incorporate will_paginate into an Angular on Ruby on Rails app.}
  spec.description   = %q{}
  spec.homepage      = "http://github.com/nirds/ng_will_paginate"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "sqlite3"
  spec.add_runtime_dependency "will_paginate"

end
