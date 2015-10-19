FactoryGirl.define do
  factory :cart, :class => 'SimpleCart::Cart' do
    customer
    cart_item
  end
end