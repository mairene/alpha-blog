class AddAddressToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :address, :text
    add_column :articles, :latitude, :float
    add_column :articles, :longitude, :float
    add_column :articles, :destination_id, :integer
  end
end
