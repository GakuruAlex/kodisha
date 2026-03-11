class AddDetailsToHouse < ActiveRecord::Migration[8.1]
  def change
    add_column :houses, :is_occupied, :boolean, default: false
  end
end
