class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:alert] = 'Category has successfully been created'
      redirect_to @category
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
