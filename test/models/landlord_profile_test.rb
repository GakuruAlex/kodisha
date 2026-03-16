# == Schema Information
#
# Table name: landlord_profiles
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_landlord_profiles_on_user_id  (user_id)
#

require "test_helper"

class LandlordProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
