# == Schema Information
#
# Table name: house_bills
#
#  id            :integer          not null, primary key
#  house_id      :integer          not null
#  water_bill    :decimal(, )
#  rent          :decimal(, )
#  electric_bill :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_house_bills_on_house_id  (house_id)
#

class HouseBill < ApplicationRecord
  belongs_to :house
end
