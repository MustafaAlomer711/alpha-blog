class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @user = User.all
  end

  def edit
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User successfully created'
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end