# == Schema Information
#
# Table name: landlord_profiles
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_landlord_profiles_on_user_id  (user_id)
#

class LandlordProfile < ApplicationRecord
  belongs_to :user
  has_many :estates
  has_many :houses, through: :estates, class_name: "House"
  has_many :tenant_profiles, through: :houses, class_name: "TenantProfile"
end
