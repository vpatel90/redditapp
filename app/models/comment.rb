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
end
