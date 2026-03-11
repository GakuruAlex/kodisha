class CreateLandlordProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :landlord_profiles do |t|
      t.timestamps
    end
  end
end
