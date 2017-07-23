class Api::V1::Security::UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name
end
