class RemoveColsLongLatFromDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :longitude, :float
    remove_column :destinations, :latitude, :float
  end

  def change
  	add_column :destinations, :county_code, :string
  end
end
