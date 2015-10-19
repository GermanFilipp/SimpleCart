require 'rails_helper'
include ActionView::Helpers::NumberHelper

module SimpleCart
  feature 'view all cart items, and manipulate with them' do
    given(:user) {FactoryGirl.create(:user)}
    given!(:product) {FactoryGirl.create(:product)}
    given!(:cart_item) {FactoryGirl.create(:cart_item, product: product, quantity: 3)}
    given(:cart){FactoryGirl.create(:cart, customer: user, cart_item: cart_item)}

    before do
      login_as user
      visit cart_path
    end


    scenario 'view all order_items' do
      expect(page).to have_content product.title
      expect(page).to have_content number_to_currency product.price*3
    end


    scenario 'change quantity of product' do
      fill_in "quantity[#{product.id}]", with: 5
      click_button 'Update'
      expect(page).to have_content number_to_currency product.price*5
    end


    scenario 'click on EMPTY CART' do
      click_on 'Destroy_all'
      expect(page).to have_content 'Cart successfully destroyed'
      expect(page).to have_content 'Cart is empty'
    end

  end
end