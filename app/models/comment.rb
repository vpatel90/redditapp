class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  has_many :votes, :as => :votable


  validates :body, presence: true

  after_save :add_to_counter_cache

  def user_name
    user.user_name
  end

  def time
    "#{updated_at.strftime('%x')} on #{updated_at.strftime('%r')}"
  end

  def net_votes
    self.pos_votes - self.neg_votes
  end

  def add_to_counter_cache
    link = Link.find(self.link_id)
    link.comment_counter += 1
    link.save!
  end

end
