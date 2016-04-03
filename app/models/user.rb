class User < ActiveRecord::Base
  has_many :links
  has_many :votes
  has_many :comments

  validates :user_name, presence: true

  validates :user_name, uniqueness: {
    scope: :user_name,
    message: "Taken"
  }

  validates :email, uniqueness: {
    scope: :email,
    message: "Taken"
  }

  def paginate_comments(pgnum)
    comments.order(updated_at: :desc).page pgnum
  end

  def paginate_links(pgnum)
    links.order(updated_at: :desc).page pgnum
  end
end
