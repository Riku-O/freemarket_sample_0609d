class ItemRegistrationForm
  include ActiveModel::Model
  validates :name, presence: true
  validates :condition, presence: true
  validates :postage_burden, presence: true
  validates :shipping_method, presence: true
  validates :source_area, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :item_images,presence: true
  attr_accessor :name, :description, :category_id,
                :condition, :postage_burden, :shipping_method,
                :source_area, :shipping_date, :price, :user_id

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
      @item_images_attributes = ItemImage.new(attributes)
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
      condition: condition,
      price: price,
      postage_burden: postage_burden,
      shipping_date: shipping_date,
      shipping_method: shipping_method,
      source_area: source_area,
      category_id: category_id,
      user_id: 1
    }
  end

  def build_association
    item.item_images << item_images
  end
end