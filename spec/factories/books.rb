FactoryGirl.define do
  factory :book do
    name { 'Book' + Faker::Name.name }
    price { rand(100) }
  end
end
