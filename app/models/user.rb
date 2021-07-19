class User < ApplicationRecord

  has_many :oogiris, 
  
  mount_uploader :image, ImageUploader
end
