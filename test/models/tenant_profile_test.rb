# == Schema Information
#
# Table name: tenant_profiles
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  firstname   :string
#  lastname    :string
#  phonenumber :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tenant_profiles_on_user_id  (user_id)
#

require "test_helper"

class TenantProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
