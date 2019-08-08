class ItemImage < ApplicationRecord
  belongs_to :item
  # mount_uploader :image, ImageUploader
  validates :image, presence: true
  validate :check_number_of_images

  # imagesの数を制限するvalidation、validationがfalseしたときの挙動はどうしようか
  def check_number_of_images
    if item.images.count > 11
      false
      errors.add(:item_images, "画像は１０枚までしか保存できません。")
    end
  end
end
