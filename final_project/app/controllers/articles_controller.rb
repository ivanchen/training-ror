class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def show
		@articles = Article.find(params[:id])
		if @articles.nil?
			redirect_to articles_path, :notice => "Mohon maaf, kami tidak menemuka article yang Anda cari"
		end
	end

	def create
		article = Article.new(params[:article])
	    if article.save
	      if current_user.is_admin?
	        redirect_to admin_articles_path, :notice => "article: "<<article.title<<" berhasil disimpan"
	      else
	        redirect_to articles_path, :notice => "article: "<<article.title<<" berhasil disimpan"  
	      end
	    else
	      render :action => :new , :notice => "article: "<<article.title<<" gagal disimpan"
	    end
	end

	def edit
		id = params[:id]
	    @article = Article.find(id)
	    @status = "edit"
	    if current_user.id !=@article.user.id
	    	redirect_to articles_path, :notice => "Anda tidak memiliki hak untuk memperbaharui "<<@article.title
		end
	end

	def update
		id = params[:id]
	    title = params[:article][:title]
	    user_id = params[:article][:user_id]
	    if current_user.id ==user_id
		    @article = Article.find(id)
		    status = @article.update_attributes(params[:article])
		    if status
		      redirect_to articles_path, :notice => "article: "<<title<<" berhasil diperbaharui"
		    else
		      redirect_to articles_path, :notice => "article: "<<title<<" gagal diperbaharui"
		    end
		else
			redirect_to articles_path, :notice => "Anda tidak memiliki hak untuk memperbaharui "<<title
		end
	end

	def destroy
		id = params[:id]
	    @article_id = Article.find(id)
	    title=@article_id.title
	    if @article_id.user.id == current_user.id || current_user.is_admin?
	      if @article_id.destroy
	        redirect_to articles_path, :notice => "article: "<<title<<" berhasil dihapus"
	      else
	        redirect_to articles_path, :notice => "article: "<<title<<" gagal dihapus"
	      end
	    else
	      redirect_to articles_path, :notice => "article: "<<title<<" gagal dihapus"
	    end
	end

end
