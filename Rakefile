require 'sinatra/activerecord/rake'

Dir.glob('lib/tasks/*.rake').each { |r| load r}

namespace :db do
  task :load_config do
    require './application'
  end
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end