class Sale < ApplicationRecord
  belongs_to :user
  has_many :sales_products, dependent: :destroy
  has_many :products, through: :sales_products


  def self.sales_products(id)
    @sale = Sale.find(id).sales_products.joins(:product).
            select('sales_products.*, products.name, products.code, products.price, products.description')
  end

end
