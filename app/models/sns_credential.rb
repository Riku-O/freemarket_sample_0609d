class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true # userのバリデーション外す
end
