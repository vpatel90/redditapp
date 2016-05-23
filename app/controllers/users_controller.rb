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
    @user = User.new(user_params)


    if @user.save
      log_in @user
      
      redirect_to '/'
    else

      flash[:alert] = @user.errors.full_messages[0]
      redirect_to '/users/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
