class Board < ActiveRecord::Base
  has_many :links

  validates :name, presence: true
  paginates_per 30
end
