class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates :title, presence: true
  validates :url, presence: true

end
