require 'rails/generators'


module SimpleCart
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def copy_initializer_file
      append_to_file 'config/application.rb' do
        'SimpleCart.setup do |config|
           config.set_cart_on_each_request = true
        end'
      end
      route "mount SimpleCart::Engine, at: '/cart', as: 'simple_cart'"

    end
  end
end