require 'coveralls'
Coveralls.wear!

require File.expand_path('../../config/environment', __FILE__)

require 'airborne'
require 'database_cleaner'
require 'factory_girl'
require 'grape-entity-matchers'

Application.load!
Application.connect!

Airborne.configure do |config|
  config.rack_app = API
end

Dir["#{File.expand_path('../', __FILE__)}/factories/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
