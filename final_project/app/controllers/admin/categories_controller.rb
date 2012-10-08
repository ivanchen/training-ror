class Admin::CategoriesController < ApplicationController
	before_filter :require_admin_login, :only => [:destroy]
	protect_from_forgery
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
		@parent_category = Category.getParent.map{|x| [x.name, x.id]}
	end

	def create
		category = Category.new(params[:category])
	    if current_user.is_admin?
	      if category.save
	        redirect_to admin_categories_path, :notice => "category: "<<category.name<<" berhasil disimpan"
	      else
	        redirect_to admin_categories_path, :notice => "category: "<<category.name<<" berhasil disimpan"  
	      end
	    else
	      render :action => :new , :notice => "category: "<<category.name<<" gagal disimpan"
	    end
	end

	def destroy
	    id = params[:id]
	    @category = Category.find(id)
	    name=@category.name
	    if current_user.is_admin?
	      if @category.destroy
	        redirect_to admin_categories_path, :notice => "category: "<<name<<" berhasil dihapus"
	      else
	        redirect_to admin_categories_path, :notice => "category: "<<name<<" gagal dihapus"
	      end
	    else
	      redirect_to admin_categories_path, :notice => "category: "<<name<<" gagal dihapus"
	    end
  	end
end
