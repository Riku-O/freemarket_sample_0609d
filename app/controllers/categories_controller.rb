class CategoriesController < ApplicationController
  def index
    category = Category.find(params[:category_id])
    @sub_categories = category.children
    respond_to do |format|
      format.html
      format.json
    end
  end
end