class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :update]

  # GET /stocks
  def index
    if params[:code].present?
      begin               
        @stock = Stock.find_by_code( params[:code] )
        render action: "show", layout: "layouts/application" 
      rescue        
        error!("Product with code #{params[:code]} not found", :not_found)
      end   
    else      
      @stocks = Stock.total

      render action: "index", layout: "layouts/application" 
    end
    
  end

  # GET /stocks/1
  def show
    render action: "show", layout: "layouts/application"
  end

  # PATCH/PUT /stocks/1
  def update
    if @stock.update_quantity
      render action: "show", layout: "layouts/application"
    else
      error_array!(@stock.full_messages, :unprocessable_entity)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])         
    end

    # Only allow a trusted parameter "white list" through.
    def stock_params
      params.require(:stock).permit(:quantity, :product_id, :code)
    end
end
