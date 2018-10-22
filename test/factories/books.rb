FactoryBot.define do
  factory :book do
    title { Faker::Name.title }
    language { 'english' }
    price { rand(10..1000) }
    author_id { create(:author).id }
  end
end