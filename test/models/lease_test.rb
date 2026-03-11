# == Schema Information
#
# Table name: leases
#
#  id                :integer          not null, primary key
#  house_id          :integer          not null
#  tenant_profile_id :integer          not null
#  begin             :date
#  end               :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_leases_on_house_id           (house_id)
#  index_leases_on_tenant_profile_id  (tenant_profile_id)
#

require "test_helper"

class LeaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
