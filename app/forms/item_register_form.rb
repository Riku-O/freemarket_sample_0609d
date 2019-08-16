class ItemRegisterForm
  include ActiveModel::Model
  validates :name, presence: true
  validates :size, presence: true
  validates :condition, presence: true
  validates :postage_burden, presence: true
  validates :shipping_method, presence: true
  validates :source_area, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :image,presence: true

  concerning :ItemBuilder do
    def item
      @item ||= Item.new
    end
  end

  concerning :ItemImageBuilder do
    attr_reader :item_images_attributes
    def item_images
      @item_images_attributes ||= ItemImage.new
    end
  end

  # TODO:ブランドの実装は後ほど
  # concerning :BrandBuilder do
  #   attr_reader :brand_attributes
  # end

end