class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  after_save :add_to_counter_cache

  validates :user_id, uniqueness: {
    scope: :votable,
    message: "cannot vote for the same item more than once"
  }

  def add_to_counter_cache
    row = Object.const_get(self.votable_type).find(self.votable_id)
    if self.value > 0
      row.pos_votes += 1
    else
      row.neg_votes += 1
    end
    row.save!
  end
end
