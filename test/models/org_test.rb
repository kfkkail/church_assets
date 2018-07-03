# frozen_string_literal: true

require 'test_helper'

describe Org do
  let(:org) { FactoryBot.create(:org) }

  it 'should be valid' do
    value(org).must_be :valid?
    Org.count.must_equal 1
  end
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
