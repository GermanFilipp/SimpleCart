require 'rails_helper'

module SimpleCart
  RSpec.describe CartsController, type: :controller do
    routes { SimpleCart::Engine.routes }
    let(:user) { FactoryGirl.create(:user) }
    let(:cart) { FactoryGirl.create :cart }
    let(:product) {FactoryGirl.create :product}
    let(:cart_item) {FactoryGirl.create :cart_item, cart: cart, product: product}


    before do
      login_as user
      allow(controller).to receive(:current_cart) { cart }
    end



    describe 'GET #show' do
      before do
        get :show
      end

      it 'should render :show template' do
        expect(response).to render_template('show')
      end
    end

    describe 'PUT #update' do
      it 'change quantity' do
        put :update, "quantity"=>{"#{cart_item.id}"=>"3"}
        cart_item.reload
        expect(cart_item.quantity).to eq(3)
      end
    end

    describe 'DELETE #destroy' do
      it 'delete all cart items from current cart' do
        delete :destroy
        cart.reload
        expect(cart.cart_items).to be_blank
      end
    end

  end
end