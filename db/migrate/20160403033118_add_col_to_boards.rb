class AddColToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :desc, :string, default: "This Board has no Description"
  end
end
