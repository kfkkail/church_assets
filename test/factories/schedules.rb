# frozen_string_literal: true

FactoryBot.define do
  factory :schedule do
  end
end

# == Schema Information
#
# Table name: schedules
#
#  id         :bigint(8)        not null, primary key
#  duration   :integer
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :integer
#  user_id    :integer
#
