class ProductsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_product, only: [:edit, :destroy, :update]

  def index
    @products = current_user.products.all
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to products_path, flash:{ notice:"Item has been Created, Thanks!"}
    else 
      render :new
    end
  end

  def edit
  end

  def update 
    if @product.update(product_params)
      redirect_to products_path, flash:{notice:"Item Data has been Updated"}
    else 
      render :edit, flash:{notice:"Item has Not been Updated. Please Verify Details"}
    end
  end

  def destroy 
    if @product.destroy
      redirect_to products_path, flash:{notice:"Item has been deleted.Thanks!"}
    end
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
    unless @product.present?
      redirect_to products_path, flash:{notice:"Item does not exist"}
    end
  end

  def product_params
    params.require(:product).permit(:name,:your_name,:comapny_name,:description,:bank_account,:quantity,:starting_bid,:expected_bid,:phone_number)
  end

end
