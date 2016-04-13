class Link < ActiveRecord::Base

  belongs_to :user
  belongs_to :board
  has_many :votes, :as => :votable
  has_many :comments

  validates :title, presence: true
  validates :url, presence: true
  validates :board_id, presence: true

  def net_votes
    self.pos_votes - self.neg_votes
  end

  def user_name
    user.user_name
  end

  def board_name
    board.name
  end

  def total_comments
    comments.count
  end

  def time
    "#{updated_at.strftime('%x')} on #{updated_at.strftime('%r')}"
  end

  def has_current_user_vote?(id)
    votes.find_by(user_id: id)
  end
end
