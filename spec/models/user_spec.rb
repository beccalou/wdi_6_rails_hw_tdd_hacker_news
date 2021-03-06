# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe User do
	it 'is invalid without an email' do
	expect(User.create(password: 'password')).to_not be_valid
	end

	it 'is invalid without a password' do
		expect(User.create(email: 'becky@email.com')).to_not be_valid
	end

describe 'associations' do
	it { should have_many :submissions}
	it { should have_many :comments}
end


end