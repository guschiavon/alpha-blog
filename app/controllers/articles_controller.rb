class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all # Instance variables allow us to use ERB on the view to render data dynamically; they are bound to the 
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description)) # require the top level key of 'article' (the database structure) and permit the title and description to be available to create the new article
    if @article.save # saves the record on the database
      flash[:notice] = "Congrats! Your article has been created"
      redirect_to @article
    else
      render 'new'
    end
  end

end