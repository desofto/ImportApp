FactoryGirl.define do
  factory :company do
   sequence(:name) { |n| "test_#{n}" }
  end
end
