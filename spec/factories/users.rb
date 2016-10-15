FactoryGirl.define do
  factory :users do
    username { Faker::Name.name }
  end
end

