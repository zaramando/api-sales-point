class CreateSalesProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_products do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
