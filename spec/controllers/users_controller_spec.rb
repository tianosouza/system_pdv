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
    context "when current_user creating a new user" do
      it "creating a new user as admin" do
        current_user = create(:user, role: "admin")
        session[:user_id] = current_user.id
        expect {
          post :create, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end
    end

    context "when current_user is not an admin" do
      it "does not create a new user" do
        current_user = create(:user)
        session[:user_id] = current_user.id
        expect {
          post :create, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    context "when current_user is admin" do
      it "updates the user" do
        user = create(:user, name: "Fulano", role: "admin")
        session[:user_id] = user.id
        put :update, params: { id: user.to_param, user: { name: "Fulano" } }
        user.reload
        expect(user.name).to eq("Fulano")
      end
    end

    context "when current_user is not an admin" do
      it "does not update the user" do
        user = create(:user)
        session[:user_id] = user.id
        put :update, params: { id: user.to_param, user: { name: "Fulano" } }
        user.reload
        expect(user.name).not_to eq("Fulano")
      end
    end
  end

  describe "POST #sign_in" do
    context "when the user sign_in" do
      it "returns a success response" do
        user = create(:user, password: "123456", password_confirmation: "123456")
        post :sign_in, params: { email: user.email, password: "123456" }
        expect(response).to be_successful
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
