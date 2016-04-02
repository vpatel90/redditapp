class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by(email: params[:sessions][:email])
    if user
      log_in user
      redirect_to '/'
    else
      flash[:alert] = "error"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/' 
  end
end
