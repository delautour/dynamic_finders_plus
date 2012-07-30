#-*- encoding: utf-8 -*-
require File.expand_path('../lib/dynamic_finders_plus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Courtney de Lautour"]
  gem.email         = ["clautour@thefrontiergroup.com.au"]
  gem.description   = %q{Adds a number of extra dynamic finders to active record models}
  gem.summary       = %q{Adds a number of extra dynamic finders to active record models}
  gem.homepage      = "https://github.com/Amerdrix/dynamic_finders_plus"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "dynamic_finders_plus"
  gem.require_paths = ["lib"]
  gem.version       = DynamicFindersPlus::VERSION

  gem.add_dependency "activemodel", "~>3.2.0"
  gem.add_dependency 'activesupport'

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "activerecord"
  gem.add_development_dependency 'sqlite3'
end
