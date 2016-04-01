class VotesController < ApplicationController
  def create
    Vote.create(value:params[:value], link_id:params[:id], user_id:1)
    redirect_to(:back)
  end
end
