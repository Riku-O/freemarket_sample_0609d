class ItemRegistrationFormsController < ApplicationController

  def new
    @item_registration_form = ItemRegistrationForm.new
  end

  def create
    @item_registration_form = ItemRegistrationForm.new(item_registration_params)
    if @item_registration_form.save
      redirect_to @item
    else
      render :'items/index'
    end
  end

  private
  # TODO:アイテムのブランドは後日実装
  def item_registration_params
    params.require(:item_registration_form).permit(:name, :condition,
                                          :postage_burden, :shipping_method, :source_area,
                                          :shipping_date, :price, :description,
                                          :category_id,
                                          item_images_attributes: [:image])
                                          .merge(user_id: 1)
  end
end