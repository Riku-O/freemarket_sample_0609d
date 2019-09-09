class ItemRegistrationFormsController < ApplicationController
  before_action :authenticate_user!

  def new
    @item_registration_form = ItemRegistrationForm.new
  end

  def create
    @item_registration_form = ItemRegistrationForm.new(item_registration_params)
    if @item_registration_form.save
      redirect_to item_path(@item_registration_form.item.id)
    else
      render :new
    end
  end

  def edit
    @item_registration_form = ItemRegistrationForm.new(name: set_item.name, condition_id: set_item.condition_id,
                                                       post_burden_id: set_item.post_burden_id, source_area_id: set_item.source_area_id,
                                                       shipping_date_id: set_item.shipping_date_id,
                                                       price: set_item.price, description: set_item.description,
                                                       category_id: set_item.category_id, user_id: set_item.user_id,
                                                       item_images_attributes: {image: set_item.item_images.first.image}
                                                       )
    if @item_registration_form.update
      redirect_to item_path
    else
      render :edit
    end
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
                                          .merge(user_id: current_user.id)
  end

  def set_item
    Item.find(params[:id])
  end
end