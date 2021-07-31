# == Schema Information 


class User < ApplicationRecord
  has_many :oogiris, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
end
