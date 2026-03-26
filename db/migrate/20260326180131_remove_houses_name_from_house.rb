class RemoveHousesNameFromHouse < ActiveRecord::Migration[8.1]
  def change
    remove_column :houses, :houses_name
  end
end
