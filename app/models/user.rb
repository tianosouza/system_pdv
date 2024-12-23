class User < ApplicationRecord
  has_secure_password

  with_options presence: true do
    validates :name
    validates :email
    validates :password_digest
    validates :password_confirmation
  end

  validates :role, inclusion: { in: %w[user admin maneger cashier employee] }

  def first_name
    name.split(" ").first
  end
end
