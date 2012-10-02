class CommentsController < ApplicationController
  def show
  	@comments = Comment.find_all_by_article_id(params[:id])
  	@comment = Comment.new
  	@article = Article.find(params[:id])
  end

	def create
    # raise params.inspect
    comment = Comment.new(params[:comment])
    # raise article.inspect

 respond_to do |format|
  if comment.save
      format.html { redirect_to comment_path(comment.article.id), :notice => "comment untuk artikel : "<<comment.article.title<<" berhasil disimpan" }
      format.js { @comments = Comment.find_all_by_article_id(comment.article) }
    end
  end

    # if comment.save
    #   redirect_to comment_path(comment.article.id), :notice => "comment untuk artikel : "<<comment.article.title<<" berhasil disimpan"
    # else
    #   render :action => :show , :notice => "comment untuk artikel : "<<comment.article.title<<" gagal disimpan"
    # end
  end

end
