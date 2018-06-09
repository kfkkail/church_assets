class Article < ApplicationRecord
  has_one :org
  has_and_belongs_to_many :tasks
end

# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  org_id      :integer
#
