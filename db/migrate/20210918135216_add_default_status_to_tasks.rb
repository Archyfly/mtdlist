class AddDefaultStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :status, 1
  end
end
