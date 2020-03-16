require 'capybara/poltergeist'
  require 'factory_girl_rails'
  require 'capybara/rspec'

  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include FactoryGirl::Syntax::Methods
  Capybara.javascript_driver = :poltergeist
  Capybara.server = :puma 