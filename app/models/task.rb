# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :org
  belongs_to :article
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
#  article_id  :integer
#  org_id      :integer
#
