module SimpleCart
  class CartsController < ApplicationController

    def show
      @cart = current_cart
    end



    def update
      params[:quantity].each do |item_id, quantity|
        current_cart.cart_items.find_by_id(item_id).update(quantity: quantity)
      end
      flash[:success] = t('cart.update')
      redirect_to :back
    end


    def destroy
      respond_to do |format|
        if current_cart.destroy
        format.html { redirect_to :back, notice: t('cart.destroy') }
        else
        format.html { redirect_to :back, alert: t('cart.not_destroy') }
      end
      end
    end
  end
end
