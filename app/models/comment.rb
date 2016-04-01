class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  has_many :votes, :as => :votable

  validates :body, presence: true

  def user_name
    user.user_name
  end

  def time
    "#{updated_at.strftime('%x')} on #{updated_at.strftime('%r')}"
  end

  def total_votes
    votes.where('value > 0').count - votes.where('value < 0').count
  end
end
