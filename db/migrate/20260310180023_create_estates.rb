class CreateEstates < ActiveRecord::Migration[8.1]
  def change
    create_table :estates do |t|
      t.references :landlord_profile, null: false, foreign_key: true
      t.string :name
      t.string :location
      t.boolean :has_vacancy

      t.timestamps
    end
  end
end
