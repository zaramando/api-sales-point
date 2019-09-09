class Sale < ApplicationRecord
  belongs_to :user
  has_many :sales_products, dependent: :destroy
  has_many :products, through: :sales_products
end
