class AddOrgToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :org_id, :integer
  end
end
