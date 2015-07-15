# Provides a mount for the Grape API. Rack uses this class to map requests
# to responses.
class API < Grape::API
  mount PostController => '/posts'
  mount TagController => '/tags'
end
