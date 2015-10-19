module SimpleCart
  class CartsController < ApplicationController

    def show
      @cart = current_cart
    end

    def update
      params[:quantity].each do |item_id, quantity|
         current_cart.cart_items.find_by(id: item_id).update(quantity: quantity)
         current_cart.price
      end

      redirect_to :back, notice:  t('cart.update')
    end

    def destroy
      current_cart.cart_items.destroy_all
      current_cart.update(total_price: 0)
      redirect_to :back, notice: t('cart.destroy')
    end


  end
end
