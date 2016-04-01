class LinksController < ApplicationController
  def index
    @links = Link.order(updated_at: :desc).page params[:page]
  end


  def show
    @link = Link.find(params[:id])
    @comments = @link.comments.order(updated_at: :desc).page params[:page]
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new
    @link.title = params[:link][:title]
    @link.url = params[:link][:url]
    @link.user_id = params[:link][:user_id]

    Link.create(title: params[:link][:title], user_id: params[:link][:user_id])
    if @link.save
      redirect_to link_path(@link.id)
    else
      flash[:alert] = "error"
      render :new
    end
  end

  def create_vote
    link = Link.find(params[:id])
    link.votes.build(value:params[:value], user_id:1)
    link.save
    redirect_to(:back)
  end
end
