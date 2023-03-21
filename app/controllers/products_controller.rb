class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :destroy]
  def index
    if current_user
      @products = Product.all 
    else
      redirect_to home_index_path, flash:{alert:"Please Sign In"}
    end
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to products_path, flash:{ notice:"Item has been Created, Thanks!"}
      else 
      render :new
      end
  end
  def edit
  end
  def update 
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      redirect_to products_path, flash:{notice:"Item Data has been Updated"}
    else 
      render :edit, flash:{notice:"Item has Not been Updated. Please Verify Details"}
    end
  end
  def destroy 
    if current_user && @product.destroy
      redirect_to products_path
    else
      redirect_to products_path, flash:{alert:"You are not login. please login first!"}
    end
  end
  private
  def set_product
    if Product.find_by(id: params[:id]).nil?
      redirect_to products_path, flash:{notice:"Item does not exist"}
    else
      @product = Product.find_by(id: params[:id])
    end
    end
  def product_params
    params.require(:product).permit(:name,:your_name,:comapny_name,:description,:bank_account,:quantity,:starting_bid,:expected_bid,:phone_number)
  end
end
