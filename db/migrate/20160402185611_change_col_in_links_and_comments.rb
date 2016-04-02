class ChangeColInLinksAndComments < ActiveRecord::Migration
  def change
    change_column :links, :pos_votes, :integer, default: 0
    change_column :links, :neg_votes, :integer, default: 0
    change_column :comments, :pos_votes, :integer, default: 0
    change_column :comments, :neg_votes, :integer, default: 0
  end
end
