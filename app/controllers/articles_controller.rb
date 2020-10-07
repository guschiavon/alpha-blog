class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update]
  

  def index
    @articles = Article.all # Instance variables allow us to use ERB on the view to render data dynamically; they are bound to the 
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params) # require the top level key of 'article' (the database structure) and permit the title and description to be available to create the new article
    if @article.save # saves the record on the database
      flash[:notice] = "Congrats! Your article has been created"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article has been updated."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy    
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id]) # in order to populate the article view for edit, we call the same method which pulls the data from the database
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end