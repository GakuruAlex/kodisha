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

require "test_helper"

class EstateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
