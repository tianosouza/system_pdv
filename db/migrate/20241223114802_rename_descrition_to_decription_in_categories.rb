class RenameDescritionToDecriptionInCategories < ActiveRecord::Migration[8.0]
  def change
    rename_column :categories, :descrition, :description
  end
end
