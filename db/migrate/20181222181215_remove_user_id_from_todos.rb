class RemoveUserIdFromTodos < ActiveRecord::Migration[5.1]
  def change
    remove_column :todos, :user_id, :string
  end
end
