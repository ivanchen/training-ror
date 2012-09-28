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
    if comment.save
      redirect_to articles_path, :notice => "comment untuk artikel : "<<comment.article.title<<" berhasil disimpan"
    else
      render :action => :show , :notice => "comment untuk artikel : "<<comment.article.title<<" gagal disimpan"
    end
  end

end
