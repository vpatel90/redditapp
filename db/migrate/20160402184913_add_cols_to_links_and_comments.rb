class AddColsToLinksAndComments < ActiveRecord::Migration
  def change
    add_column :links, :pos_votes, :integer
    add_column :links, :neg_votes, :integer
    add_column :comments, :pos_votes, :integer
    add_column :comments, :neg_votes, :integer
  end
end
