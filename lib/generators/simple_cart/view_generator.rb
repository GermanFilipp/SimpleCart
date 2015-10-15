require 'rails/generators'


module SimpleCart
  module Generators
    class ViewGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates/simple_cart", __FILE__)

      def copy_views
        directory "carts", "app/views/simple_cart/carts"
        directory "cart_items", "app/views/simple_cart/cart_items"
      end

    end
  end

end