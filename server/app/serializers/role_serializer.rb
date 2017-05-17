class RoleSerializer < ActiveModel::Serializer
  attribute :role

  has_many :users
end
