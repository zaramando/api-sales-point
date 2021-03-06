class Stock < ApplicationRecord
  belongs_to :product
  before_create :before_update_quantity
  
  
  def update_quantity
    self.update(quantity: self.quantity + 1)
  end 

  def update_quantity_up(quantity)
    self.update(quantity: self.quantity + quantity)
  end

  def update_quantity_down(quantity)
    self.update(quantity: self.quantity - quantity)
  end

  #scope :items, ->{joins(:product)}
  def self.total
    Stock.joins(:product).
    select('stocks.*, products.name, products.code, products.price, products.description' )
  end

  def self.find_by_code(code)
    @stock = Stock.find_by(product_id: Product.find_by(code: code )[:id])
    @stock = Stock.joins(:product).
             select('products.name, products.code, products.price, stocks.*').
             where(id: @stock[:id]).first 
  end
  
  private
    def before_update_quantity
      self.quantity = 0
    end

  
end
