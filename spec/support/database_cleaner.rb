RSpec.configure do |config|
    config.before(:suite) do
        DatabaseCleaner.strategy = :transaction
        DatabaseCleaner.clean_with(:truncation)
    end
  
    config.around(:each) do |configuration|
        DatabaseCleaner.cleaning do
            configuration&.run
        end
    end
end
