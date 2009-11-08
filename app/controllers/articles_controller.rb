class ArticlesController < ApplicationController
  
  def index
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.from_url(params[:article][:url])
    @sources = Source.search_by_url(@article.url)
    @source  = Source.new
    return if params[:temporary]
    
    @article.user = logged_in_user if @article.new_record?
    @article.attributes = params[:article]
    
    if params[:article][:source_id] == 'other'
      @source = Source.create(params[:source])
      @article.source = @source
    end
    
    return unless @article.save
    redirect_to article_path(@article)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
end

