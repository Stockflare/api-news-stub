require File.expand_path('../config/environment', __FILE__)

Application.load!

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :options]
  end
end

run API
