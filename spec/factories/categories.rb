FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department }
    sequence(:code) { |n| "#{name}_00#{n}" }
    description { name }
  end
end
