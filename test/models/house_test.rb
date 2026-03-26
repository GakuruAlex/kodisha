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

require "test_helper"

class HouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
