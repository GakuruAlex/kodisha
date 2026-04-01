# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email_address   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :integer          default(0), not null
#  firstname       :string
#  lastname        :string
#  phonenumber     :string
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#

class User < ApplicationRecord
  enum :role, { guest: 0, member: 1, admin: 2 }
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one :tenant_profile, dependent: :destroy
  has_one :landlord_profile, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, uniqueness: true
end
