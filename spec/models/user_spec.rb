require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  context "when creating a new user with valid attributes" do
    it "is valid with valid factory-bot attributes" do
      user = create(:user)
      expect(user).to be_valid
    end

    it "is valid with valid attributes" do
      user = User.new(
        name: "Fulano",
        email: "fulano@pdvsystem.com",
        password_digest: "123456",
        password_confirmation: "123456",
        role: "user"
      )
      expect(user).to be_valid
    end
  end

  context "when creating a new user with invalid attributes" do
    it "is not valid without a name" do
      user = User.new(
        name: nil,
        email: "fulano@pdvsystem.com",
        password_digest: "123456",
        password_confirmation: "123456",
        role: "user"
      )
      expect(user).not_to be_valid
    end

    it "is not valid without an email" do
      @user.update(email: nil)
      expect(@user).not_to be_valid
    end

    it "is not valid without a password_digest" do
      @user.update(password_digest: nil)
      expect(@user).not_to be_valid
    end

    it "is not valid without a password_confimation" do
      @user.update(password_confirmation: nil)
      expect(@user).not_to be_valid
    end
  end

  context "when creating a new user with valid role" do
    it "is valid with user role" do
      @user.update(role: "user")
      expect(@user).to be_valid
    end

    it "is valid with admin role" do
      @user.update(role: "admin")
      expect(@user).to be_valid
    end

    it "is valid with manager role" do
      @user.update(role: "maneger")
      expect(@user).to be_valid
    end

    it "is valid with cashier role" do
      @user.update(role: "cashier")
      expect(@user).to be_valid
    end

    it "is valid with employee role" do
      @user.update(role: "employee")
      expect(@user).to be_valid
    end
  end

  context "when creating a new user with invalid role" do
    it "is not valid with invalid role" do
      @user.update(role: "visitor")
      expect(@user).not_to be_valid
    end
  end

  context "when creating a new user with first name" do
    it "returns the first name" do
      @user.update(name: "Fulano_1 System Pdv")
      expect(@user.first_name).to eq("Fulano_1")
    end
  end
end
