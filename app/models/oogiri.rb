class Oogiri < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :oogiri, presence: true, length: { maximum: 140 }

  belongs_to :user
  default_scope -> { order(created_at::desc)}
  mount_uploader :image, ImageUploader
end
