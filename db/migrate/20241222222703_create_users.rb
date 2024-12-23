class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, if_not_exists: true  do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :password_confirmation
      t.string :role, default: "user", null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
