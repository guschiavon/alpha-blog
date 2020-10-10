class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :create, :destroy]

  def show
    @articles = @user.articles
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:notice] = "Welcome #{@user.username}!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    
  end

  def destroy

  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end