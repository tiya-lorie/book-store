FactoryBot.define do
  factory :customer do
    name { Faker::Name.title }
    language { 'english' }
    country { Faker::Address.state }
    address { Faker::Address.full_address }
    telephone { 1111111111 }
    email { 'test@gmail.com' }
  end
end