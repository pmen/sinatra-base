namespace :base do

  task :basic_rake_task do
    require './application'

    puts 'Hello, world.'
  end

end