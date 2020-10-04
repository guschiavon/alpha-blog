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

  def edit
    @article = Article.find(params[:id]) # in order to populate the article view for edit, we call the same method of 'show' which pulls the data from the database
    
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

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article has been updated."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end