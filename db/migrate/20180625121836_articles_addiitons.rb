class ArticlesAddiitons < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :cost, :replacement_cost
    add_column :articles, :purchase_price, :decimal, precision: 11, scale: 4, default: 0
    add_column :articles, :purchase_vendor, :string
    add_column :articles, :purchase_invoice, :string

    change_column_default :articles, :useful_life_span, 0
    change_column_default :articles, :replacement_cost, 0
  end
end
