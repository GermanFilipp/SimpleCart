require 'rails_helper'

module SimpleCart
  RSpec.describe CartItemsController, type: :controller do
    routes { SimpleCart::Engine.routes }

    let(:cart) { FactoryGirl.create(:cart) }
    let(:product) { FactoryGirl.create(:product) }

    before do
      login_as user
      allow(controller).to receive(:current_cart) { cart }
    end

    describe 'POST #create' do

      it 'should assign @product' do
        post :create, class: product.class.to_s.downcase, id: product.id
        expect(assigns(:product)).not_to be_nil
      end

      it 'it expect to redirect to root_path' do
        post :add_product, class: product.class.to_s.downcase, id: product.id
        expect(response).to redirect_to(:back)
      end

    end

    describe 'DELETE #destroy' do

      it 'should assign @product' do
        delete :destroy, class: product.class.to_s.downcase, id: product.id
        expect(assigns(:product)).not_to be_nil
      end

      it 'it expect to redirect to root_path' do
        delete :destroy, class: product.class.to_s.downcase, id: product.id
        expect(response).to redirect_to(root_path)
      end

    end

  end
end