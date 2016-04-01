class Link < ActiveRecord::Base

  belongs_to :user
  has_many :votes, :as => :votable
  has_many :comments

  validates :title, presence: true
  validates :url, presence: true

  def total_votes
    votes.where('value > 0').count - votes.where('value < 0').count
  end

  def user_name
    user.user_name
  end

  def total_comments
    comments.count
  end

  def time
    "#{updated_at.strftime('%x')} on #{updated_at.strftime('%r')}"
  end
end
