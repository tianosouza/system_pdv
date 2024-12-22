class User < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :email
    validates :password_digest
    validates :password_confirmation
  end

  validates :role, inclusion: { in: %w[user admin maneger cashier] }
end
