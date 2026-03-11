class CreateHouseBills < ActiveRecord::Migration[8.1]
  def change
    create_table :house_bills do |t|
      t.references :house, null: false, foreign_key: true
      t.decimal :water_bill
      t.decimal :rent
      t.decimal :electric_bill

      t.timestamps
    end
  end
end
