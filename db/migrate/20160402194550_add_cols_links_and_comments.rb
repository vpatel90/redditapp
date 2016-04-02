class AddColsLinksAndComments < ActiveRecord::Migration
  def change
    add_column :links, :total_votes, :integer, default: 0
    add_column :comments, :total_votes, :integer, default: 0

  end
end
