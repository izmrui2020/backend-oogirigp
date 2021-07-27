class User < ApplicationRecord
  has_many :oogiris, dependent: :destroy
  mount_base64_uploader :avatarSrc, AvatarUploader
end
