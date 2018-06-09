# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  org_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  start_date  :datetime
#

class Task < ApplicationRecord
  has_one :org
  has_and_belongs_to_many :articles
end
