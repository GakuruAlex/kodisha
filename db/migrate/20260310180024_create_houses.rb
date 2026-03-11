class CreateHouses < ActiveRecord::Migration[8.1]
  def change
    create_table :houses do |t|
      t.string :house_id
      t.references :estate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
