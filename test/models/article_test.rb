# frozen_string_literal: true

require 'test_helper'

describe Article do
  let(:article) { FactoryBot.create(:article) }

  it 'should be valid' do
    value(article).must_be :valid?
  end
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
