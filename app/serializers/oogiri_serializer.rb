class OogiriSerializer < ActiveModel::Serializer
  attributes :id, :title, :oogiri, :description, :username

  belongs_to :user, serializer: UserSerializer
end
