FactoryGirl.define do


  factory :cart_item, :class => 'SimpleCart::CartItem' do
    quantity { [*1..10].sample }
    product
    cart
  end

end