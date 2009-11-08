class ArticlesController < ApplicationController
  
  def index
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.from_url(params[:article][:url])
    @sources = Source.search_by_url(@article.url)
    return if params[:temporary]
    
    @article.user = logged_in_user if @article.new_record?
    @article.update_attributes(params[:article])
    return unless @article.save
    
    redirect_to article_path(@article)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
end

