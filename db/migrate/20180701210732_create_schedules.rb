class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer 'duration'
      t.integer 'article_id'
      t.integer 'user_id'
      t.datetime 'start_date'

      t.timestamps
    end
  end
end
