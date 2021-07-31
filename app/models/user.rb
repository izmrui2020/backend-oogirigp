# == Schema Information 


class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_many :oogiris, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
end
