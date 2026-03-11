class CreateLeases < ActiveRecord::Migration[8.1]
  def change
    create_table :leases do |t|
      t.references :house, null: false, foreign_key: true
      t.references :tenant_profile, null: false, foreign_key: true
      t.date :begin
      t.date :end

      t.timestamps
    end
  end
end
