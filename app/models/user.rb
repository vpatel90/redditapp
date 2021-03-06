class User < ActiveRecord::Base
  has_many :links
  has_many :votes
  has_many :comments

  has_secure_password

  validates :user_name, presence: true
  validates :email, presence: true

  validates :user_name, uniqueness: {
    message: "Taken"
  }

  validates :email, uniqueness: {
    message: "Taken"
  }

  def link_vote_count
    vote = 0
    links.each do |link|
      vote = vote + link.net_votes
    end
    vote
  end

  def comment_vote_count
    vote = 0
    comments.each do |comment|
      vote = vote + comment.net_votes
    end
    vote
  end

  def paginate_comments(pgnum)
    comments.order(updated_at: :desc).page pgnum
  end

  def paginate_links(pgnum)
    links.order(updated_at: :desc).page pgnum
  end
end
