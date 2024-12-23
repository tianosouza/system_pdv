FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { "This is product #{name}" }

    sequence(:barcode) { |n| "#{Faker::Barcode.ean}-#{n}" }

    price { Faker::Commerce.price(range: 5..100.0) }
    cost_price { Faker::Commerce.price(range: 3..90.0) }

    association :category

    stock_quantity { rand(1..50) }
    min_stock { rand(1..10) }
    active { true }

    after(:create) do |product|
      product.update(sku: "SKU-#{product.id}-#{product.category.to_s.upcase.strip}")
    end
  end
end
