class UsersController < ApplicationController
  def index
    @users = User.order(updated_at: :desc).page params[:page]
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.user_name = params[:user][:user_name]
    @user.email = params[:user][:email]


    if @user.save
      redirect_to '/'
    else

      flash[:alert] = @user.errors.full_messages[0]
      redirect_to '/users/new'
    end
  end
end
