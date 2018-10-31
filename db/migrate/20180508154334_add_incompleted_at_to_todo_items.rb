class AddIncompletedAtToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :incompleted_at, :datetime
  end
end
