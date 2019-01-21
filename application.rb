require './config/initializers' # Should always come first

require 'pry' if ENV['RACK_ENV'] == 'development'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'sinatra/reloader'

require './app/models'
require './lib'
require './app/routes'

# TODO rename me
module PlaceholderName
  class Application < Sinatra::Base

    register Sinatra::ActiveRecordExtension

    configure do
      set :database_file, 'config/database.yml'
    end

    configure :development do
      register Sinatra::Reloader
    end

    get '/' do
      'Hello world'
    end

  end
end