FactoryGirl.define do
  factory :book_transaction do
    association :user, factory: :user
    association :book, factory: :book

    trait :successful do
      status { 'successful' }
    end

    trait :pending do
      status { 'pending' }
    end
  end
end
