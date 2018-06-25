# frozen_string_literal: true

FactoryBot.define do
  factory :article do
  end
end

# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  cost             :decimal(11, 4)
#  department       :string
#  description      :string
#  location         :string
#  manufacturer     :string
#  model_number     :string
#  name             :string
#  room             :string
#  serial_number    :string
#  useful_life_span :decimal(11, 4)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  org_id           :integer
#
