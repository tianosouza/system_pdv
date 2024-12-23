require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = create(:user)
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post :create, params: { user: attributes_for(:user) }
          }.to change(User, :count).by(1)
      end
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      it "updates the requested user" do
        user = create(:user)
        put :update, params: { id: user.to_param, user: attributes_for(:user) }
        user.reload
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = create(:user)
      expect {
        delete :destroy, params: { id: user.to_param }
        }.to change(User, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
