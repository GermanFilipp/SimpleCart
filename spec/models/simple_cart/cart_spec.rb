require 'rails_helper'

module SimpleCart
  RSpec.describe Cart, type: :model do
    subject(:cart) { FactoryGirl.create :cart }


    it { expect(cart).to belong_to(:customer) }
    it { expect(cart).to have_many(:cart_items)}

    describe '#add_product' do
      let(:quantity) { 2 }

      context 'with cart_item that contain product' do
        let(:cart_item) { FactoryGirl.create(:cart_item, cart: cart) }

        it 'expect to update cart_item with cart_item.quantity + quantity' do
          old = cart_item.quantity
          cart.add_product(cart_item.product, quantity)
          cart_item.reload
          expect(cart_item.quantity).to eq(old + quantity)
        end
      end

    end


    describe '#remove_product' do
      let!(:cart_item) { FactoryGirl.create(:cart_item, cart: cart) }

      context 'with quantity less then cart_item quantity' do
        it 'expect to update order_item with cart_item.quantity + quantity' do
          cart.remove_product(cart_item.product)
          cart_item.reload
          expect(cart_item.quantity).to eq(1)
        end
      end

      context 'with quantity equal or more then cart_item quantity' do
        it 'expect to destroy order_item' do
          old = cart.cart_items.size
          cart.remove_product(cart_item.product)
          cart.cart_items.reload
          expect(cart.cart_items.size).to eq(old - 1)
        end
      end
    end



    describe ".price" do
      products = FactoryGirl.create_list(:product)
      it "should return total price of the cart" do
        products.each {|p| cart.add_product(p)}
        sum = products.inject(0){|sum,p| sum + p.price }
        expect(cart.total_price).to eq(sum)
      end
    end


  end
end
