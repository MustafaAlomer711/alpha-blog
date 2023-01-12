class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in? && current_user
      @articles = Article.paginate(page: params[:page], per_page: 5)
    else
      redirect_to signup_path
    end
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit

  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article updated'
      redirect_to @article
    else
      flash[:notice] = 'Article was not updated'
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article successfully posted'
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to article_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
