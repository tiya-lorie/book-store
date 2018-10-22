FactoryBot.define do
  factory :bag do
  	customer_id { create(:customer).id }
  end
end