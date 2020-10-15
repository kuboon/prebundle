require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :build do
  puts "gem build prebundle.gemspec"
end
namespace :deploy do
  task :github do
    puts "gem push --key github --host https://rubygems.pkg.github.com/kuboon prebundle-0.2.4.gem"
  end
end
