class ProductsController < ApplicationController
	def index
		@products  = Product.all
	end

	def show
		@products = Product.find(params[:id])
		if @products.present?
		else
			redirect_to products_path, :notice => "Mohon maaf, kami tidak menemuka product yang Anda cari"
		end
	end

	def new
	@product = Product.new
	end

	def create
    product = Product.new(params[:product])
    if product.save
        redirect_to products_path, :notice => "product: "<<product.name<<" berhasil disimpan"  
    else
      render :action => :new , :notice => "product: "<<product.name<<" gagal disimpan"
    end
  end

	def edit
    id = params[:id]
    @product = Product.find(id)
    @status = "edit"
  	end

  	def update
  		id = params[:id]
	    name = params[:product][:name]
	    @product = Product.find(id)
	    status = @product.update_attributes(params[:product])
	    if status
	      redirect_to products_path, :notice => "Product: "<<name<<" berhasil diperbaharui"
	    else
	      redirect_to products_path, :notice => "Product: "<<name<<" gagal diperbaharui"
	    end
  	end

  	def destroy
    id = params[:id]
    @product = Product.find(id)
    name=@product.name
	    if @product.user.id == current_user.id || current_user.is_admin?
	      if @product.destroy
	        redirect_to products_path, :notice => "Product: "<<name<<" berhasil dihapus"
	      else
	        redirect_to products_path, :notice => "Product: "<<name<<" gagal dihapus"
	      end
	    else
	      redirect_to products_path, :notice => "Product: "<<name<<" gagal dihapus"
	    end
  	end
end
