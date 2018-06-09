class Task < ApplicationRecord
  has_one :org
  has_and_belongs_to_many :articles
end

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  start_date  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  org_id      :integer
#
