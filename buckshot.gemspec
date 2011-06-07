$:.unshift File.expand_path("../lib", __FILE__)
require "buckshot"

Gem::Specification.new do |gem|
  gem.name     = "buckshot"
  gem.version  = Buckshot::VERSION

  gem.author = "David Dollar"
  gem.email = "ddollar@gmail.com"
  gem.homepage = "http://heroku.com"

  gem.summary  = "Helper for switching between shotgun and thin"
  gem.homepage = "http://github.com/ddollar/buckshot"
  gem.executables = "buckshot"

  gem.files = %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(README|bin/|data/|ext/|lib/|spec/|test/)} }

  gem.add_dependency "shotgun"
  gem.add_dependency "thin"

  gem.add_development_dependency "fakefs"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rcov"
  gem.add_development_dependency "rr"
  gem.add_development_dependency "rspec"
end
