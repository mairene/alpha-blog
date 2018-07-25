class FixCountryCodeName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :destinations, :county_code, :country_code
  end
end
