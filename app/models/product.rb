class Product < ApplicationRecord
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :cost_price
    validates :stock_quantity
    validates :min_stock
  end

  after_create :sku_generator
  after_create :barcode_generator

  def sku_generator
    self.sku = "SKU-#{self.id}-#{self.category.to_s.upcase.strip}"
  end

  def self.prefix
    "085"+Time.now.strftime("%Y%m%d")
  end

  def barcode_generator
    if self.barcode == nil
      self.barcode = "#{Product.prefix} #{self.id}"
    end
  end
end
