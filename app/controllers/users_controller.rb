class UsersController < ApplicationController
  def index
    @users = User.order(updated_at: :desc).page params[:page]
  end

  def show
    @user = User.find(params[:id])
  end
end
