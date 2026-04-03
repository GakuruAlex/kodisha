# == Schema Information
#
# Table name: houses
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  estate_id   :integer          not null
#  house_type  :integer          default(0), not null
#  is_occupied :boolean          default(FALSE)
#  updated_at  :datetime         not null
#  house_name  :string
#
# Indexes
#
#  index_houses_on_estate_id  (estate_id)
#

class House < ApplicationRecord
  enum :house_type, { bed_sitter: 0, one_bedroom: 1, two_bedroom: 2 }, default: "bed_sitter"
  belongs_to :estate, counter_cache: true
  has_many :leases
  has_many :tenant_profiles, through: :leases
  has_one :house_bill
  validates :house_name, presence: true
  validates :house_name, length: { minimum: 1 }
  validates :house_type, inclusion: { in: house_types.keys, message: "%{value} is not a valid house type" }
end
