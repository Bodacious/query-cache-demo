require_relative "boot"

%w(
  active_record/railtie
  action_controller/railtie
  action_view/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QueryCacheDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.generators do |g|
      g.orm :active_record
      g.helper false
      g.resource_route false
      g.scaffold_controller false
      g.system_tests false
      g.test_framework false
    end
  end
end
