require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = create(:product)
  end

  it { should belong_to(:category) }

  it "is valid attributes with product factory " do
    expect(@product).to be_valid
  end

  it "is valid with valid attributes" do
    product = Product.new(
      name: "Product Test",
      description: "This is product test",
      barcode: "123456789",
      price: 10.0,
      cost_price: 5.0,
      stock_quantity: 10,
      min_stock: 5,
      active: true,
      category: create(:category)
    )
    expect(product).to be_valid
  end

  context "when creating a new product with invalid attributes" do
    it "is not valid without a name" do
      @product.update(name: nil)
      expect(@product).not_to be_valid
    end

    it "is not valid without a description" do
      @product.update(description: nil)
      expect(@product).not_to be_valid
    end

    it "is not valid without a price" do
      @product.update(price: nil)
      expect(@product).not_to be_valid
    end

    it "is not valid without a cost_price" do
      @product.update(cost_price: nil)
      expect(@product).not_to be_valid
    end

    it "is not valid without a stock_quantity" do
      @product.update(stock_quantity: nil)
      expect(@product).not_to be_valid
    end

    it "is not valid without a min_stock" do
      @product.update(min_stock: nil)
      expect(@product).not_to be_valid
    end
  end

  context "when creating a new product and update with methods" do
    it "is valid with sku_generator method" do
      @product.sku_generator
      expect(@product.sku).to eq("SKU-#{@product.id}-#{Category.last.to_s.upcase.strip}")
    end

    it "is valid with barcode_generator method" do
      product = create(:product, barcode: nil)
      product.barcode_generator
      expect(product.barcode).to eq("#{Product.prefix} #{product.id}")
    end
  end
end
