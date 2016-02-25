class CategoriesController < ApplicationController
  def create
    @category = Category.find(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      flash.now[:error] = "Invalid Category"
      render :new
    end

  end

  private

  def category_params
    params.require(:category).permit(:title)
  end


end
