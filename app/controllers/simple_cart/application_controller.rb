module SimpleCart
  class ApplicationController < SimpleCart.parent_controller.constantize
    before_action set_current_cart unless SimpleCart.set_cart_on_each_request
  end
end
