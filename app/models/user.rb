class User < ActiveRecord::Base
  has_many :links
  has_many :votes

  validates :user_name, presence: true
end
