class ChangeColsLinksComments < ActiveRecord::Migration
  def change
    add_column :links, :net_votes, :integer, default: 0
    add_column :comments, :net_votes, :integer, default: 0
  end
end
