class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    board = Board.find_by(name: params[:id].downcase)
    if board
      @links = board.links.order(updated_at: :desc).page params[:page]
    else
      flash[:alert] = "Could Not find this Board"
      redirect_to '/'
    end
  end

  def new
  end
end
