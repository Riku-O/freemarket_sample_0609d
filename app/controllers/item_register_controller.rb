class ItemRegisterController < ApplicationController
  def new
    @item_register = ItemRegisterForm.new
  end

  def create
    @item_register = ItemRegisterForm.new(set_params)
    if @item_register.save
      redirect_to @item
    else
      render :new
    end
  end

  private
  def set_params
    params.require(:item_register).permit(:name, :size, :condition,
                                          :postage_burden, :shipping_method, :source_area,
                                          :shipping_date, :price, :description,
                                          :category_id, :image)
                                  .merge(user_id: 1)
  end
end