ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'mocha/mini_test'
require 'shoulda-matchers'
require 'shoulda-context'

require File.expand_path '../../application.rb', __FILE__

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :minitest

    # Choose one or more libraries:
    with.library :active_record
    with.library :active_model
  end
end