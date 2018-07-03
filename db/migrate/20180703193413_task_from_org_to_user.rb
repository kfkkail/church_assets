class TaskFromOrgToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :org_id
    add_column :tasks, :user_id, :integer
  end
end
