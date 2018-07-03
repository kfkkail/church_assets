class FixTasksRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :article_id
    add_column :tasks, :schedule_id, :integer
  end
end
