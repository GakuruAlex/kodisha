class AddHouseTypeToHouse < ActiveRecord::Migration[8.1]
  def change
    add_column :houses, :house_type, :integer, default: 0, null: false
  end
end
