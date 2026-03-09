# == Schema Information
#
# Table name: tenant_profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tenant_profiles_on_user_id  (user_id)
#

class TenantProfile < ApplicationRecord
  belongs_to :user
end
