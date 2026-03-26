class AddDetailToHouse < ActiveRecord::Migration[8.1]
  def change
    add_column :houses, :house_name, :string
  end
end
