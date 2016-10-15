FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { SecureRandom.urlsafe_base64(9) }

    trait :with_books do
      after(:create) do |user|
        create_list :book, 2, user: user
      end
    end
  end
end

