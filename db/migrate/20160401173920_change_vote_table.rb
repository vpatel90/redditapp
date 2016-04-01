class ChangeVoteTable < ActiveRecord::Migration
  def change
    remove_column :votes, :link_id
    add_column :votes, :votable_id, :integer
    add_column :votes, :votable_type, :string
    add_column :links, :comment_counter, :integer
  end
end
