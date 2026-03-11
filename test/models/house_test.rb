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

require "test_helper"

class HouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
