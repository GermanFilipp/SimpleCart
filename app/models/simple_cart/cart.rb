module SimpleCart
  class Cart < ActiveRecord::Base
    belongs_to :customer, polymorphic: true
    has_many :cart_items


    after_create do
      self.update(number: "R"+rand(100000000..999999999).to_s)
    end

    def add_product(product, quantity=1)
      cart_item = self.cart_items.find_by(product: product)
      if cart_item.nil?
        cart_items.create(product: product, quantity: quantity)
      else
        cart_items.update(quantity: quantity.to_i)
      end
    end


    def remove_product(product)
      cart_item = cart_items.find_by(product: product)
      return false unless cart_item
      cart_item.destroy
    end


    def price
     self.total_price = self.cart_items.reload.map.sum(&:price)
     self.save
    end

  end
end
