class ItemRegistrationFormsController < ApplicationController

  def new
    @item_registration_form = ItemRegistrationForm.new
  end

  def create
    @item_registration_form = ItemRegistrationForm.new(item_registration_params)
    if @item_registration_form.save
      redirect_to @item
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  # TODO:アイテムのブランドは後日実装
  def item_registration_params
    params.require(:item_registration_form).permit(:name, :condition_id,
                                          :post_burden_id, :shipping_method_id, :source_area_id,
                                          :shipping_date_id, :price, :description,
                                          :category_id,
                                          item_images_attributes: [:image])
                                          .merge(user_id: 1)
  end
end