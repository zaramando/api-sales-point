class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :update, :destroy]

  # GET /sales
  def index
    @sales = Sale.all

    render action: "index", layout: "layouts/application"
  end

  # GET /sales/1
  def show    
    @products = @sale.sales_products     

    #render json: { id: @sale[:id], payment: @sale[:payment], products: @products}, status: :ok
    render action: "show", layout: "layouts/application"     
  end

  # POST /sales
  def create
    @sale = @current_user.sales.new(payment: sale_params[:payment] )

    if @sale.save
      sale_params[:products].each do |item_product|
        @sales_products = @sale.sales_products.new(item_product)
        @sales_products.save                  
    end  
      render json: @sale, status: :created, location: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sales/1
  def update
    if @sale.update(sale_params)
      render json: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
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

    # Only allow a trusted parameter "white list" through.
    def sale_params
      params.require(:sale).permit(:payment, :products => [:product_id, :quantity])     
    end

end
