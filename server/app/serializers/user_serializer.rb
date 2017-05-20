class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :email, :token

  has_many :roles # do |serializer|
  #   serializer.roles
  # end
end
