# == Schema Information
#
# Table name: landlord_profiles
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LandlordProfile < ApplicationRecord
  has_many :estates
  has_many :houses, through: :estates, class_name: "House"
  has_many :tenant_profiles, through: :houses, class_name: "TenantProfile"
end
