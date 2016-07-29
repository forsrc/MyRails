class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "123456", except: [:index, :show]

  def new
    @article = Article.new
  end
  
  def create
    # render plain: params[:article].inspect

    @article = Article.new(article_params_new)
    if @article.save
      redirect_to @article
    else
      ## render plain: format("Error save -> %s \n\n %s",
      ##                    @article.errors.inspect,
      ##                    params[:article].inspect)
      render "new"
    end


  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params_update)
      redirect_to @article
    else
      render "edit"
    end
  end


  def show
    # render plain: params[:id].inspect
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  private
  def article_params_new
    params.require(:article).permit(:title, :text)
  end

  private
  def article_params_update
    params.require(:article).permit(:id, :title, :text)
  end

end
