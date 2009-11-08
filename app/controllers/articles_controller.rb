class ArticlesController < ApplicationController
  
  def index
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.from_url(params[:article][:url])
    return unless !params[:temporary] and @article.save
    redirect_to article_path(@article)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
end

