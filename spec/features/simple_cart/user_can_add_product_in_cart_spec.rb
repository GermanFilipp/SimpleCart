require 'rails_helper'

module SimpleCart
  feature 'Add product in cart' do
    given(:user) {FactoryGirl.create(:user)}
    given!(:product) {FactoryGirl.create(:product)}

    before do
      login_as user
      visit book_path(product)
    end

    scenario 'User add product to cart' do
      fill_in 'quantity', with: 3
      click_button 'Add'
      expect(page).to have_content 'Product successfully added to your cart'
    end
  end
end