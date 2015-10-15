module SimpleCart
  class CartItemsController < ApplicationController
    before_action :set_product!

    def create
      respond_to do |format|
        if current_cart.add_product(@product, params[:quantity])
          format.html { redirect_to :back, notice: t('cart.added') }
        else
          format.html { redirect_to :back, alert: t('cart.not_added') }
        end
      end
    end


    def destroy
      if current_cart.remove_product(@product)
        format.html { redirect_to :back, notice: t('cart.removed') }
      else
        format.html { redirect_to :back, alert: t('cart.not_removed') }
      end
    end


    protected
      def set_product!
        class_name = SimpleCart::PRODUCT_CLASSES.detect { |c| c == params[:class] }
        @product = class_name.camelize.constantize.find(params[:id])
      end

  end
end
