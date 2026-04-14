# == Schema Information
#
# Table name: estates
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  has_vacancy         :boolean
#  landlord_profile_id :integer          not null
#  location            :string
#  name                :string
#  updated_at          :datetime         not null
#  houses_count        :integer          default(0)
#
# Indexes
#
#  index_estates_on_landlord_profile_id  (landlord_profile_id)
#

class Estate < ApplicationRecord
  belongs_to :landlord_profile
  has_many :houses, dependent: :destroy
  has_many :tenant_profiles, through: :houses
  validates_presence_of :location, :name
end
