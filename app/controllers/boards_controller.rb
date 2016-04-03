class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find_by(name: params[:id].downcase)
    if @board
      @links = @board.links.order(total_votes: :desc).order(pos_votes: :desc).page params[:page]
    else
      flash[:alert] = "Could Not find this Board"
      redirect_to '/'
    end
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new
    @board.name = params[:board][:name].downcase
    @board.desc = params[:board][:desc]
    if @board.save
      redirect_to b_path
    else
      flash[:alert] = @board.errors.full_messages[0]
      redirect_to new_b_path
    end
  end
end
