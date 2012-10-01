class Admin::ArticlesController < ApplicationController
	before_filter :require_admin_login, :only => [:destroy]
  protect_from_forgery

  def create
    # raise params.inspect
    article = Article.new(params[:article])
    # raise article.inspect
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

  def destroy
    id = params[:id]
    @article_id = Article.find(id)
    title=@article_id.title
    if @article_id.user.id == current_user.id
      if @article_id.destroy
        redirect_to articles_path, :notice => "article: "<<title<<" berhasil dihapus"
      else
        redirect_to articles_path, :notice => "article: "<<title<<" gagal dihapus"
      end
    else
      redirect_to articles_path, :notice => "article: "<<title<<" gagal dihapus"
    end
  end

def index
  @articles = Article.all
end
end
