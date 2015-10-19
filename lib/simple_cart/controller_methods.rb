module SimpleCart
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      if SimpleCart.set_cart_on_each_request
        before_action :set_current_cart
      end
    end

    def current_cart
      @current_cart
    end

    def set_current_cart
      begin
        @current_cart = SimpleCart::Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        create_current_cart
      end
    end

    def create_current_cart
      @current_cart = current_customer.carts.first_or_create
          #SimpleCart::Cart.create
          #current_customer.carts.first_or_create
      session[:cart_id] = @current_cart.id
    end


  end
end