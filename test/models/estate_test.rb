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

require "test_helper"

class EstateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
