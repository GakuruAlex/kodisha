class CreateUtilities < ActiveRecord::Migration[8.1]
  def change
    create_table :utilities do |t|
      t.string :name
      t.references :house, foreign_key: true
      t.string :meter_no
      t.decimal :last_reading

      t.timestamps
    end
  end
end
