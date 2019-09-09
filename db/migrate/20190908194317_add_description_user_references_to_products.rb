class AddDescriptionUserReferencesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :description, :text
    add_reference :products, :user, foreign_key: true
  end
end
