class LinksController < ApplicationController
  def index
    @links = Link.order(updated_at: :desc).page params[:page]
  end


  def show
    @link = Link.find(params[:id])
  end
end
