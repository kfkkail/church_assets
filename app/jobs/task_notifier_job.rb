# frozen_string_literal: true

class TaskNotifierJob < ApplicationJob
  def perform
    Org.find_each do |org|
      org.users.each do |user|
        UserMailer.tasks_list(user.id).deliver_later if user.tasks.past_due.count.positive?
      end
    end
  end
end
