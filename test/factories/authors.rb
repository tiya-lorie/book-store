FactoryBot.define do
  factory :author do
    name { Faker::Name.title }
    language { 'english' }
  end
end