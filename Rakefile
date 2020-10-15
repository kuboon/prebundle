require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :deploy do
  task :rubygems do
   puts "gem release"
  end
  task :github => :build do
    puts "gem push --key github --host https://rubygems.pkg.github.com/kuboon prebundle-0.2.4.gem"
  end
end
