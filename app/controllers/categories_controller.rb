class CategoriesController < ApplicationController
  def index
    category = Category.find(category_params[:category_id])
    @sub_categories = category.children
    respond_to do |format|
      format.html
      format.json
    end
  end
  private
  def category_params
    params.permit(:category_id, :controller, :action)
  end
end