class AddHouseNameToHouse < ActiveRecord::Migration[8.1]
  def change
    add_column :houses, :houses_name, :string
  end
end
