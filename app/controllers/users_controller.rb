class UsersController < ApplicationController
  before_action :authenticate_user!, only: %w[show edit update destroy]

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
    @user = User.create(user_params)
    if @user.save
      redirect_to users_path, flash: { success: 'User successfully created!' }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), flash: { success: "User successfully updated!."}
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, flash: { success: 'User deleted.' }
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
