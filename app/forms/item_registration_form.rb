class ItemRegistrationForm
  include ActiveModel::Model
  validates :name, presence: true
  validates :condition_id, presence: true
  validates :post_burden_id, presence: true
  # validates :shipping_method, presence: true
  validates :source_area_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :item_images,presence: true
  attr_accessor :name, :description, :category_id,
                :condition_id, :post_burden_id, :shipping_method_id,
                :source_area_id, :shipping_date_id, :price, :user_id

  concerning :ItemBuilder do
    attr_reader :user_id
    def item
      @item ||= Item.new
    end
  end

  concerning :ItemImageBuilder do
    attr_reader :item_images_attributes

    def item_images
      @item_images_attributes ||= ItemImage.new
    end

    def item_images_attributes=(attributes)
      @item_images_attributes = []
      attributes[:image].each do |attribute|
        item_images_attribute = ItemImage.new(image: attribute)
        @item_images_attributes << item_images_attribute
      end
      @item_images_attributes
    end

  end

  def save
    false if invalid?
    item.assign_attributes(item_params)
    build_association
    
    if item.save
      true
    else
      false
    end
  end

  # TODO:ブランドの実装は後ほど
  # concerning :BrandBuilder do
  #   attr_reader :brand_attributes
  # end

  private

  def item_params
    {
      name: name,
      description: description,
      condition_id: condition_id,
      price: price,
      post_burden_id: post_burden_id,
      shipping_date_id: shipping_date_id,
      # shipping_method: shipping_method,
      source_area_id: source_area_id,
      category_id: category_id,
      user_id: user_id
    }
  end

  def build_association
    item.item_images << item_images
  end
end