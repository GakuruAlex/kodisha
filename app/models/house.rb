# == Schema Information
#
# Table name: houses
#
#  id          :integer          not null, primary key
#  estate_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  houses_name :string
#  house_type  :integer          default(0), not null
#  is_occupied :boolean          default(FALSE)
#
# Indexes
#
#  index_houses_on_estate_id  (estate_id)
#

class House < ApplicationRecord
  enum :house_type, { bed_sitter: 0, one_bedroom: 1, two_bedroom: 2 }, default: :bed_sitter
  belongs_to :estate
  has_many :leases
  has_many :tenant_profiles, through: :leases
  has_one :house_bill
end
