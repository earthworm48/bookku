FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { SecureRandom.urlsafe_base64(9) }
  end
end

