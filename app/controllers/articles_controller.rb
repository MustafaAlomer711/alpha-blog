class ArticlesController < ApplicationController
  before_action :find_article, only: [:show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new
    if @article.save
    end
  end

  private

  def article_params
    params.require(:article).permit(:name, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
