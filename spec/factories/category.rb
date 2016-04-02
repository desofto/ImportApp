FactoryGirl.define do
  factory :category do
   sequence(:name) { |n| "test_#{n}" }
  end
end
