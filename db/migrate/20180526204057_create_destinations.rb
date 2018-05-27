class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :title
      t.float :longitude
      t.float :latitude
      t.boolean :current, default: false
      t.timestamps
    end
  end
end
