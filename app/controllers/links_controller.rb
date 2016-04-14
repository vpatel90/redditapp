class LinksController < ApplicationController
  def index
    @links = Link.order(net_votes: :desc).page params[:page]
    respond_to do |format|
      format.html do
        @links
      end
      format.json do
        render json: @links.to_json(methods: [:user_name, :board_name, :time, :total_comments])
      end
    end
  end

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments.order(net_votes: :desc).page params[:page]
  end

  def new
    @link = Link.new
    @options = []
    Board.all.each do |board|
      @options << [board.name, board.id]
    end
  end

  def create
    @link = Link.new
    @link.title = params[:link][:title]
    @link.url = params[:link][:url]
    @link.user_id = current_user.id
    @link.board_id = params[:link][:board_id]

    if @link.save
      redirect_to link_path(@link.id)
    else
      flash[:alert] = @link.errors.full_messages[0]
      redirect_to new_link_path
    end
  end

  def create_vote
    if logged_in?
      link = Link.find(params[:id])
      link.votes.build(value:params[:value], user_id:current_user.id)
      link.save
      redirect_to(:back)
    else
      flash[:alert] = "You must log in to do that"
      redirect_to sessions_path
    end
  end
end
