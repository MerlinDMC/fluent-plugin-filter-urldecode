# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "fluent-plugin-filter-urldecode"
  gem.description = "A filter plugin to decode percent encoded fields"
  gem.license     = "MIT"
  gem.homepage    = "https://github.com/MerlinDMC/fluent-plugin-filter-urldecode"
  gem.summary     = gem.description
  gem.version     = "0.1.0"
  gem.authors     = ["Daniel Malon"]
  gem.email       = "daniel.malon@me.com"
  gem.has_rdoc    = false
  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_runtime_dependency "fluentd", ">= 0.12"

  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "test-unit"
end
