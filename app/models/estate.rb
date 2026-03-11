# == Schema Information
#
# Table name: estates
#
#  id                  :integer          not null, primary key
#  landlord_profile_id :integer          not null
#  name                :string
#  location            :string
#  has_vacancy         :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_estates_on_landlord_profile_id  (landlord_profile_id)
#

class Estate < ApplicationRecord
  belongs_to :landlord_profile
  has_many :houses
  has_many :tenant_profiles, through: :houses
end
