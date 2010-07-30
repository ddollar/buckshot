require "rake"
require "rspec"
require "rspec/core/rake_task"

$:.unshift File.expand_path("../lib", __FILE__)
require "buckshot"

task :default => :spec
task :release => :man

desc "Run all specs"
Rspec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

desc "Generate RCov code coverage report"
task :rcov => "rcov:build" do
  %x{ open coverage/index.html }
end

Rspec::Core::RakeTask.new("rcov:build") do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rcov = true
  t.rcov_opts = [ "--exclude", Gem.default_dir , "--exclude", "spec" ]
end

######################################################

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name    = "buckshot"
    s.version = Buckshot::VERSION

    s.summary     = "Helper for switching between shotgun and thin"
    s.description = s.summary
    s.author      = "David Dollar"
    s.email       = "ddollar@gmail.com"
    s.homepage    = "http://github.com/ddollar/buckshot"

    s.platform = Gem::Platform::RUBY
    s.has_rdoc = false

    s.files = %w(Rakefile README.md) + Dir["{bin,lib,spec}/**/*"]
    s.require_path = "lib"

    s.default_executable = "buckshot"

    s.add_development_dependency 'fakefs', '~> 0.2.1'
    s.add_development_dependency 'rake',   '~> 0.8.7'
    s.add_development_dependency 'rcov',   '~> 0.9.8'
    s.add_development_dependency 'rr',     '~> 0.10.11'
    s.add_development_dependency 'rspec',  '~> 2.0.0'

    s.add_dependency 'shotgun'
    s.add_dependency 'thin'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end
