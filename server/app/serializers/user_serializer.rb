class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :email

  attribute :token do |serializer|
    serializer.token
  end

  has_many :roles do |serializer|
    serializer.roles
  end

  def roles
    Role.joins(:authorities).where('authorities.user_id' => object.id).pluck(:role)
  end

  def token
    JsonWebToken.encode({ id: object.id })
  end
end
