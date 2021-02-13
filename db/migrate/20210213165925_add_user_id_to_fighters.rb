class AddUserIdToFighters < ActiveRecord::Migration[5.1]
  def change
    add_column :fighters, :user_id, :integer
    add_index :fighters, :user_id
  end
end
