class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  #skip_before_action :authenticate_request  

  
  # GET /products
  def index
    if params[:code].present?       
      if @product = Product.find_by(code: params[:code])
        render action: "show", layout: "layouts/application" 
      else
        error!("Product with code #{params[:code]} not found", :not_found)
      end  
    else  
      @products = Product.all
      render action: "index", layout: "layouts/application"       
    end 
  end

  # GET /products/1
  def show
    render action: "show", layout: "layouts/application"     
  end

  # POST /products
  def create   
   @product = @current_user.products.new(product_params)
   #@product = Product.new(product_params)


    if @product.save
       @stock = Stock.new(quantity: 1)
       @stock.product = @product
       @stock.save
      render action: "show", layout: "layouts/application", status: :created
    else
      error_array!(@product.errors.full_messages, :unprocessable_entity)
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render action: "show", layout: "layouts/application"
    else
      error_array!(@product.errors.full_messages, :unprocessable_entity)
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :code, :price, :description, :user_id)
    end
end
