FactoryGirl.define do
  factory :operation do
    company { create(:company) }
    sequence(:invoice_num) { |n| "Invoice-#{n}" }
    invoice_date '1.1.2016'
    amount 10
    operation_date '1.1.2016'
    status 'unknown'
    categories { [create(:category)] }
  end
end
