class CommentsController < ApplicationController
  def create_vote
    comment = Comment.find(params[:id])
    comment.votes.build(value:params[:value], user_id:1)
    comment.save
    redirect_to(:back)
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

end
