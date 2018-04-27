class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was successfully created'
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
      flash[:notice] = 'Article was successfully updated'
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

    flash[:notice] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end