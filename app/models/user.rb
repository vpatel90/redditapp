class User < ActiveRecord::Base
  has_many :links
  has_many :votes
  has_many :comments

  validates :user_name, presence: true
end
