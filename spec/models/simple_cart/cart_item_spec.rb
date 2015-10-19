require 'rails_helper'

module SimpleCart
  RSpec.describe CartItem, type: :model do
    subject(:cart_item) { FactoryGirl.create :cart_item }


    it { expect(cart_item).to belong_to(:cart) }
    it { expect(cart_item).to belong_to(:product) }
    it { expect(cart_item).to validate_presence_of(:quantity) }



    describe '#total_price' do
      it 'should return product#price * order_item#quantity rounded to 2' do
        expect(cart_item.price).to eq((cart_item.product.price * cart_item.quantity).round(2))
      end
    end
  end
end