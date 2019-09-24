class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :update, :destroy]

  # GET /sales
  def index
    @sales = Sale.all

    render action: "index", layout: "layouts/application"
  end

  # GET /sales/1
  def show
        
    @products = set_products(params[:id])
   
    render action: "show", layout: "layouts/application"     
  end

  # POST /sales
  def create
    @sale = @current_user.sales.new(payment: sale_params[:payment] )

    if @sale.save
      sale_params[:products].each do |item_product|
        @sale_product = @sale.sales_products.new(item_product)
        if @sale_product.save
          @stock = @sale_product.product.stock
          @stock.update_quantity_down(item_product[:quantity])
        end                    
      end  
      @products = set_products(@sale[:id])
      render action: "show", layout: "layouts/application"  
    else
      error_array!(@sale.errors.full_messages, :unprocessable_entity)
    end
  end

  # PATCH/PUT /sales/1
  def update
    if @sale.update(sale_params)
      render action: "show", layout: "layouts/application"  
    else
      error_array!(@sale.errors.full_messages, :unprocessable_entity)
    end
  end

  # DELETE /sales/1
  def destroy
    @sale.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def set_products(id)
      @products = Sale.sales_products(id)
    end  

    # Only allow a trusted parameter "white list" through.
    def sale_params
      params.require(:sale).permit(:payment, :products => [:product_id, :quantity])     
    end

end
