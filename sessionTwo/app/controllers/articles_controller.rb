class ArticlesController < ApplicationController
  before_filter :require_login, :only => [:index, :new, :create, :edit, :update, :destroy]
  def create
    # raise params.inspect
    article = Article.new(params[:article])
    # raise article.inspect
    if article.save
      redirect_to articles_path, :notice => "article: "<<article.title<<" berhasil disimpan"
    else
      render :action => :new , :notice => "article: "<<article.title<<" gagal disimpan"
    end
  end

  def new
  	@article = Article.new
  end

  def edit
    id = params[:id]
    @article_id = Article.find(id)
    @status = "edit"
  end

  def update
    id = params[:id]
    title = params[:article][:title]
    @article_id = Article.find(id)
    status = @article_id.update_attributes(params[:article])
    if status
      redirect_to articles_path, :notice => "article: "<<title<<" berhasil diperbaharui"
    else
      redirect_to articles_path, :notice => "article: "<<title<<" gagal diperbaharui"
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

