require 'bundler'
require 'cucumber'
require 'cucumber/rake/task'

include Rake::DSL

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format progress -x"
  t.fork = false
end

task default: [:features]
