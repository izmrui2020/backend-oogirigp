class User < ApplicationRecord

  has_many :oogiris, dependent: :destroy
  mount_uploader :image, ImageUploader
end
