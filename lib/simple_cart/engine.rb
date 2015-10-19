module SimpleCart
  class Engine < ::Rails::Engine
    isolate_namespace SimpleCart


    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end


    initializer 'simple_cart' do
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.include SimpleCart::ModelMethods
      end

      ActiveSupport.on_load :action_controller do
        ActionController::Base.include SimpleCart::ControllerMethods
        ActionController::Base.helper SimpleCart::ApplicationHelper
      end
    end

  end
end
