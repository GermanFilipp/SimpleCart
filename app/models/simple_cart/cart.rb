module SimpleCart
  class Cart < ActiveRecord::Base
    belongs_to :customer, polymorphic: true
    has_many :cart_items, dependent: destroy


    after_create do
      self.update(number: "R"+rand(100000000..999999999).to_s)
    end


    def add_product(product, quantity=1)
      cart_item = self.cart_items.find_by(product: product)
      if cart_item.nil?
        cart_items.create(product: product, quantity: quantity)
      else
        cart_item.update(quantity: quantity.to_i)
      end
    end


    def remove_product(product)
      cart_item = cart_items.find_by(product: product)
      return false unless cart_item
      cart_item.destroy
    end


    def total_items
      @total_items = self.cart_items.sum(:quantity) if @total_items.nil?
      @total_items
    end


    def total_price
      items_price = self.cart_items.map {|item| item.quantity*item.price}
      price = items_price.inject(&:+) || 0
      self.total_price =  price
    end

  end
end
