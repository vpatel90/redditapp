class CommentsController < ApplicationController
  def create_vote
    comment = Comment.find(params[:id])
    comment.votes.build(value:params[:value], user_id:1)
    comment.save
    redirect_to(:back)
  end

end
