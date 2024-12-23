class UsersController < ApplicationController
  before_action :load_user, only: %i[show update destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    if current_user.role == "admin"
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path, notice: "User created successfully"
      else
        render :new, notice: "User not created!"
      end
    end
  end

  def update
    if current_user.role == "admin"
      if @user.update(user_params)
        redirect_to users_path, notice: "User updated successfully"
      else
        render :show, notice: "User not updated!"
      end
    end
  end

  def destroy
    @user.destroy
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :password_confirmation, :role)
  end
end
