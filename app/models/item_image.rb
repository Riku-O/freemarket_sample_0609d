class ItemImage < ApplicationRecord
  belongs_to :item, inverse_of: :item_images
  mount_uploaders :image, ImageUploader
  validates :image, presence: true
  validate :check_number_of_images

  def save_item_images(item_images, item)
    item_images.each do |item_image|
      item.item_images.create(image: item_image)
    end
  end
  # imagesの数を制限するvalidation、validationがfalseしたときの挙動はどうしようか
  def check_number_of_images
    if item.item_images.count > 11
      false
      errors.add(:item_images, "画像は１０枚までしか保存できません。")
    end
  end
end
