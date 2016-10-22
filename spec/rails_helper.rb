# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'devise'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, :type => :controller
  # Include FactoryGirl so we can use 'create' instead of 'FactoryGirl.create'
  config.include FactoryGirl::Syntax::Methods
end

