class ChangeLinksColCommentCounter < ActiveRecord::Migration
  def change
    change_column :links, :comment_counter, :integer, default: 0
  end
end
