require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Week1Assignment
  class Application < Rails::Application
    Mongoid.load!('./config/mongoid.yml')
    #which default ORM are we using with scaffold
    #add --orm mongoid, or active_record
    # to rails generate cmd line to be specific
    config.generators {|g| g.orm :active_record}
    # config.generators {|g| g.orm :mongoid}

  config.middleware.insert_before 0, "Rack::Cors" do
    allow do
      origins '*'

      resource '/api/*',
        :headers => :any,
        # :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
        :methods => [:get, :post, :put, :delete, :options]
    end
end

    config.active_record.raise_in_transactional_callbacks = true
  end
end
