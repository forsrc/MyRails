class CommentsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "123456", only: :destroy

  def new
    @comment = Comment.new
  end

  def create
    # render plain: params[:comment].inspect

    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params_new)
    redirect_to article_path(@article)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.update(comment_params_update)
    redirect_to article_path(@article)
  end


  def show
    # render plain: params[:id].inspect
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end


  private
  def comment_params_new
    params.require(:comment).permit(:article_id, :commenter, :body)
  end

  private
  def comment_params_update
    params.require(:comment).permit(:id, :title, :text)
  end


end
