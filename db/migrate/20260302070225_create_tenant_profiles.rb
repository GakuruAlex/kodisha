class CreateTenantProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :tenant_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :phonenumber

      t.timestamps
    end
  end
end
