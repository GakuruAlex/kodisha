class AddHouseCountToEstate < ActiveRecord::Migration[8.1]
  def change
    add_column :estates, :houses_count, :integer, default: 0
  end
end
