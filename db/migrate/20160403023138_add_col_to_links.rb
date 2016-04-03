class AddColToLinks < ActiveRecord::Migration
  def change
    add_column :links, :board_id, :integer
  end
end
