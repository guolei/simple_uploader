require 'rails'
require 'builder'
require 'action_controller'
require 'application_helper'

module SimpleUploader
  class Engine < Rails::Engine

  
    initializer "static assets" do |app|
      #app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
    
  end
end
