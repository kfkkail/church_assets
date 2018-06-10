class ArticlesTasksJoin < ActiveRecord::Migration[5.0]
  def change
    create_table "articles_tasks", force: :cascade do |t|
      t.integer "article_id"
      t.integer "task_id"
      t.index ["task_id"], name: "index_articles_tasks_on_task_id", using: :btree
      t.index ["article_id"], name: "index_articles_tasks_on_article_id", using: :btree
    end
  end
end
