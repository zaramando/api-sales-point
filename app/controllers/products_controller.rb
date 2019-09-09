class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
 
  # GET /products
  def index
    if params[:code].present?       
      if @product = Product.find_by(code: params[:code])
        render json: @product, status: :ok
      else
        render json: { errors: "Product with code #{params[:code]} not found." }, status: :not_found
      end  
    else  
      @products = Product.all
      render json: @products
    end 
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
   # @product = Product.new(product_params)
   @product = @current_user.products.new(product_params)

    if @product.save
       @stock = Stock.new(quantity: 1)
       @stock.product = @product
       @stock.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy    
    render json: { errors: "Product successfully removed." }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :code, :price, :description)
    end
end
