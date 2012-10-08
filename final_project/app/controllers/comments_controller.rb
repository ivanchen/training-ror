class CommentsController < ApplicationController
	def show
		id = params[:id]
		@comments = Comment.find_all_by_article_id(id)
		@article = Article.find(id)
	end

	def new
		article_id = params[:article_id]
		@comment = Comment.new
		@article = Article.find(article_id);
	end

	def create
		comment = Article.new(params[:comment])
	    if comment.save
	        redirect_to comment_path(params[:comment][:article_id]), :notice => "comment: "<<comment.comment<<" berhasil disimpan"  
	    else
	      render :action => :new , :notice => "comment: "<<comment.comment<<" gagal disimpan"
	    end
	end

	def destroy

	end

end
