# frozen_string_literal: true

class Org < ApplicationRecord
  has_many :articles
  has_many :schedules, through: :articles
  has_many :users
end

# == Schema Information
#
# Table name: orgs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
