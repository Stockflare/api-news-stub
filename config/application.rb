require File.expand_path('../core', __FILE__)

# This file is intended to facilitate overrides to the
# basic Core loading process of the Application.
#
# For example, you can easily add more autoload_paths
# if your application requires them.
class Application < Core
  self.load_paths += %w(helpers)

  def self.connect!
    ROM.setup(Core::ORM, ENV['DATABASE_CONNECTION'], { encoding: 'utf-8' })
    load_orm
    ROM.finalize
  end

  def self.load!
    ActiveSupport::Dependencies.autoload_paths += app_load_paths
    require api
  end
end
