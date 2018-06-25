# frozen_string_literal: true

require 'test_helper'

describe Task do
  let(:task) { FactoryBot.create(:task) }

  it 'should be valid' do
    value(task).must_be :valid?
  end
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
