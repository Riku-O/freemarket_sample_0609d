class CategoriesController < ApplicationController
  def index
    if params[:category_id].present?
      @sub_categories = Category.fetch_sub_categories(category_params[:category_id])
      respond_to do |format|
        format.html
        format.json
      end
    else
      return "null"
    end
  end

  private
  def category_params
    params.permit(:category_id, :controller, :action)
  end
end