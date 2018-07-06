# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :org
  has_many :schedules
end

# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  department       :string
#  description      :string
#  location         :string
#  manufacturer     :string
#  model_number     :string
#  name             :string
#  purchase_invoice :string
#  purchase_price   :decimal(11, 4)   default(0.0)
#  purchase_vendor  :string
#  replacement_cost :decimal(11, 4)   default(0.0)
#  room             :string
#  serial_number    :string
#  useful_life_span :decimal(11, 4)   default(0.0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  org_id           :integer
#
