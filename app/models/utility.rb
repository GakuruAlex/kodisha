# == Schema Information
#
# Table name: utilities
#
#  id           :integer          not null, primary key
#  name         :string
#  house_id     :integer
#  meter_no     :string
#  last_reading :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_utilities_on_house_id  (house_id)
#

class Utility < ApplicationRecord
  enum :name, { water_bill: 0, electricity_bill: 1, gas_bill: 2 }
  validates :name, :meter_no, :last_reading, presence: true
  validates :meter_no, uniqueness: true
  validates :last_reading, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :house
end
