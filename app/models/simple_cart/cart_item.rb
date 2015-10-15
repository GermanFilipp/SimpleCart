module SimpleCart
  class CartItem < ActiveRecord::Base
    belongs_to :product,polymorphic: true
    belongs_to :cart
    validates :product, :cart, :quantity, presence: true
  end
end
