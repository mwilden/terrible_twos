require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec do |t|
  t.rspec_opts = '--tag ~slow'
  t.pattern = 'spec/**/*.%rb'
end

task default: [:spec]
