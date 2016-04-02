class LinksController < ApplicationController
  def index
    @links = Link.order(updated_at: :desc).page params[:page]
  end


  def show
    @link = Link.find(params[:id])

    @comments = @link.comments.order(net_votes: :desc).page params[:page]
    #binding.pry
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new
    @link.title = params[:link][:title]
    @link.url = params[:link][:url]
    @link.user_id = current_user.id

    if @link.save
      redirect_to link_path(@link.id)
    else
      flash[:alert] = @link.errors.full_messages[0]
      redirect_to '/links/new'
    end
  end

  def create_vote
    link = Link.find(params[:id])
    link.votes.build(value:params[:value], user_id:1)
    link.save
    redirect_to(:back)
  end
end
