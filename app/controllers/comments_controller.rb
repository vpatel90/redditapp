class CommentsController < ApplicationController
  def create_vote
    if logged_in?
      comment = Comment.find(params[:id])
      comment.votes.build(value:params[:value], user_id: current_user.id)
      comment.save
      redirect_to(:back)
    else
      flash[:alert] = "You must log in to do that"
      redirect_to sessions_path
    end
  end

  def create
    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.user_id = current_user.id
    @comment.link_id = params[:comment][:link_id]
    if @comment.save
      redirect_to link_path(params[:comment][:link_id])
    else
      flash[:alert] = @comment.errors.full_messages[0]
      redirect_to(:back)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    #link_id = @comment.link_id
    if @comment.destroy
      redirect_to(:back)
    else
      flash[:alert] = "Unable to Delete"
      redirect_to(:back)
    end
  end
end
