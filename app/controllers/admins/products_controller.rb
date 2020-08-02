class Admins::ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  	   flash[:notice] = "Product was successfully created"
  	   redirect_to admins_products_show_path(@product.id)
  	else
  	   @products = Products.all
  	   render :new
  	end
  end

  def show
  	@product = Product.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update(product_params)
  	   flash[:notice] = "Product was successfully updated"
  	   redirect_to admins_products_show(@product.id)
  	else
  	   render :edit
  	end
  end

  private
  def product_params
  	params.require(:product).permit(:product_type_id, :name, :explanation, :sales_status, :unit_price)
  end
 end
