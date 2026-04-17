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

require "test_helper"

class UtilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
