class RemoveDetailsFromTenantProfile < ActiveRecord::Migration[8.1]
  def change
    remove_column :tenant_profiles, :firstname, :string
    remove_column :tenant_profiles, :lastname, :string
    remove_column :tenant_profiles, :phonenumber, :string
  end
end
