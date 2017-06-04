class Security::UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :email, :token

  has_many :roles do
    object.roles.map(&:role)
  end
end
