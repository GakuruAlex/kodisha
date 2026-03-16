class AddUserToLandlordProfile < ActiveRecord::Migration[8.1]
  def change
    add_reference :landlord_profiles, :user, foreign_key: true
  end
end
