# frozen_string_literal: true

FactoryBot.define do
  factory :task do
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
#  org_id         :integer
#  schedule_id    :integer
#
