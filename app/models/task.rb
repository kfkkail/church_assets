# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  scope :complete, -> { where('tasks.completed_date IS NOT NULL') }
  scope :incomplete, -> { where('tasks.completed_date IS NULL') }
  scope :past_due, -> { where('tasks.due_date < ?', Time.now) }

  def completion
    return if completed_date.nil?

    due_date = Time.now + schedule.duration.days
    Task.create(
      name: schedule.name,
      due_date: due_date,
      schedule_id: schedule.id,
      user_id: schedule.user_id
    )
  end
end

# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  completed_date :datetime
#  description    :text
#  due_date       :datetime
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  schedule_id    :integer
#  user_id        :integer
#
