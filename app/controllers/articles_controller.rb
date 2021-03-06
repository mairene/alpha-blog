class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
    @destinations = Destination.all
  end

  def edit

  end

  def create
    # render plain: params[:article].inspect
    @destinations = Destination.all
    @article = Article.new(article_params)
    @article.user = current_user
    # @article.destination_id = params[:destination_id].to_i
    @article.destination = Destination.last
    if @article.save
      flash[:success] = 'Article was successfully created'
      # flash is a temporary message, that will show the first time, but won't on refresh
      # flash html defined in layouts > application.html.erb
      # html was later moved to a partial _messages in layouts folder
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update

    if @article.update(article_params)
      flash[:success] = 'Article was successfully updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    # @article = Article.find(params[:id])
    # moved to before_action above, as with destroy, etc
  end

  def destroy

    @article.destroy

    flash[:danger] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description, :rating, :address, :latitude, :longitude, :destination_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:danger] = 'You can only edit or delete your own articles'
      redirect_to root_path
    end
  end

end
