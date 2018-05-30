#------------------------------------------------------------------------------
# spec/support/database_cleaner.rb
#------------------------------------------------------------------------------
RSpec.configure do |config|
  #
  # The following configuration is documented in the following 2 blogs:
  # [Testing with Rspec, FactoryGirl, Faker and Database cleaner](https://medium.com/brief-stops/testing-with-rspec-factorygirl-faker-and-database-cleaner-651c71ca0688)
  # [Configuring database_cleaner with Rails, RSpec, Capybara, and Selenium](http://www.virtuouscode.com/2012/08/31/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/)
  #
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end