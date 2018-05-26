class AddRatingsFieldToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :rating, :string
  end
end
