class RemoveInitialValuesFromProducts < ActiveRecord::Migration[6.0]
  def change

    remove_column :products, :stock, :integer
  end
end
