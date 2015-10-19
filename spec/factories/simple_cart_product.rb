FactoryGirl.define do
  factory :product, :class => 'Book' do
    title "hello"
    price { Faker::Commerce.price }
  end
end