class Product < ApplicationRecord
    belongs_to :user
    has_one :stock, dependent: :destroy
    has_many :sales_products
    has_many :sales, through: :sales_products
    validates :code, uniqueness: { message: "This code exists" }
end
