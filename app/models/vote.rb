class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :user_id, uniqueness: {
    scope: :link_id,
    message: "cannot vote for the same item more than once"
  }

end
