module SimpleCart
  class CartItemsController < ApplicationController
    before_action :set_product!

    def create
      if current_cart.add_product(@product, params[:quantity])
        redirect_to :back, notice: t('cart.added')
      else
        redirect_to :back, alert: t('cart.not_added')
      end

    end


    def destroy
      if current_cart.remove_product(@product)
        redirect_to :back, notice: t('cart.removed')
      else
         redirect_to :back, alert: t('cart.not_removed')
      end
    end


    protected
      def set_product!
        class_name = SimpleCart::PRODUCT_CLASSES.find { |c| c == params[:class] }
        @product = class_name.camelize.constantize.find( params[:format])
      end

  end
end
