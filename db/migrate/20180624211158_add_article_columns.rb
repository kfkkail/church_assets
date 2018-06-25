class AddArticleColumns < ActiveRecord::Migration[5.2]
  def change
    drop_table :articles_tasks

    add_column :articles, :location, :string
    add_column :articles, :room, :string
    add_column :articles, :department, :string
    add_column :articles, :manufacturer, :string
    add_column :articles, :model_number, :string
    add_column :articles, :serial_number, :string
    add_column :articles, :cost, :decimal, precision: 11, scale: 4
    add_column :articles, :useful_life_span, :decimal, precision: 11, scale: 4
  end
end
