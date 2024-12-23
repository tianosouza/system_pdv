require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = create(:category)
  end

  it { should have_many(:products) }

  it "is valid atributes with category factory" do
    expect(@category).to be_valid
  end

  it "is valid with valid attributes" do
    category = Category.new(
      name: "Category Test",
      description: "This is category test",
      code: "123456",
    )
    expect(category).to be_valid
  end
end
