FactoryGirl.define do
  factory :user do
    name 'ゆうくん'
    sequence(:email) { |i| "#{i}_test_#{Time.current.to_i}@example.com" }
    password 'pass1234'
    activated true
    trait :activated do
      activated true
    end
  end
end
