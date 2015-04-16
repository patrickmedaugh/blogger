class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Article #{@article.title} created"
      redirect_to @article
    else
      flash.notice = "Article #{@article.title} could not be created"
      render :error
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash.notice = "Article: #{@article.title} was DESTROYYYYYEEEEEDDDD!!!!!!!"
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      redirect_to article
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end

end
