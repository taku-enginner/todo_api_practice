class AddUserIdToTasks < ActiveRecord::Migration[7.2]
  def change
    execute "DELETE FROM tasks";
    add_reference :tasks, :user, null: false, index: true
  end
end
