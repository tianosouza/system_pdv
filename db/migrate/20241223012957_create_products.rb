class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :sku
      t.string :barcode
      t.decimal :price
      t.decimal :cost_price
      t.references :category, null: false, foreign_key: true
      t.integer :stock_quantity
      t.integer :min_stock
      t.boolean :active

      t.timestamps
    end
  end
end
