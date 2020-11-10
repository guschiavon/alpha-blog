class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  

  def index
    @articles = Article.paginate(page: params[:page])
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
    @article.user = current_user
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
    params.require(:article).permit(:title, :description, :cover_picture, :user_id)
    
  end
  

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own articles!"
      redirect_to @article
    end
  end

end