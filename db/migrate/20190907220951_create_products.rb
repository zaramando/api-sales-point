class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code, index: true
      t.decimal :price, precision: 10, scale: 2
      t.integer :stock

      t.timestamps
    end
  end
end
