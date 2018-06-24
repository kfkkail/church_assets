# frozen_string_literal: true

require 'test_helper'

describe User do
  let(:user) { FactoryBot.create(:user) }
  let(:user_2) { FactoryBot.create(:user) }

  before do
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end

  it 'should be valid' do
    value(user).must_be :valid?
  end

  it 'initial values' do
    expect(user.org.name).must_equal('New Org')
    expect(user.role).must_equal('user')
  end

  it 'email validation' do
    user
    expect do
      user_2
    end.must_raise ActiveRecord::RecordInvalid
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("user")
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  org_id                 :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
