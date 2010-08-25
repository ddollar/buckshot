require "rubygems"
require "parka/specification"

Parka::Specification.new do |gem|
  gem.name     = "buckshot"
  gem.version  = Buckshot::VERSION
  gem.summary  = "Helper for switching between shotgun and thin"
  gem.homepage = "http://github.com/ddollar/buckshot"

  gem.executables = "buckshot"
end
