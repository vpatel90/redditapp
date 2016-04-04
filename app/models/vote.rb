class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  after_save :add_to_counter_cache

  validates :user_id, uniqueness: {
    scope: :votable,
    message: "cannot vote for the same item more than once"
  }

  def add_to_counter_cache
    row = votable
    if self.value > 0
      row.pos_votes += 1
      row.net_votes += 1
    else
      row.neg_votes += 1
      row.net_votes -= 1
    end
    row.total_votes += 1
    row.save
  end
end
