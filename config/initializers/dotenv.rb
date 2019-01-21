require 'dotenv'

Dotenv.load
Dotenv.overload('.env.production') if (File.exist?('.env.production') && ENV['RACK_ENV'] == 'production')
Dotenv.overload('.env.staging') if (File.exist?('.env.staging') && ENV['RACK_ENV'] == 'staging')
