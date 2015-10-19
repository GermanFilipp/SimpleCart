module SimpleCart
  class CartItem < ActiveRecord::Base
    belongs_to :product, polymorphic: true
    belongs_to :cart
    validates :product, :cart, :quantity, presence: true



    after_create :total_price


    def total_price
      self.price = self.product.price * quantity
      self.save
    end
  end
end
