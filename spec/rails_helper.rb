# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= "test"
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rails"
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

Capybara.app_host = "http://0.0.0.0:3000"

def login
  visit root_path
  fill_in "email", with: "mail@mail.ru"
  fill_in "password", with: "secret"
  click_button "Login"
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  Faker::Config.locale = "ru"
  config.include FactoryGirl::Syntax::Methods
  config.infer_spec_type_from_file_location!
end
