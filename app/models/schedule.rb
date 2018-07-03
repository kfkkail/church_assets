# frozen_string_literal: true

class Schedule < ApplicationRecord
  belongs_to :article
  has_many :tasks, dependent: :destroy
  belongs_to :user

  after_save :after_save_create

  private

  def after_save_create
    due_date = Time.now + duration.days
    if tasks.incomplete.count.zero?
      Task.create(
        name: name,
        due_date: due_date,
        schedule_id: id
      )
    else
      task = tasks.incomplete.first
      task.due_date = due_date
      task.save!
    end
  end
end

# == Schema Information
#
# Table name: schedules
#
#  id         :bigint(8)        not null, primary key
#  duration   :integer
#  name       :string
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :integer
#  user_id    :integer
#
