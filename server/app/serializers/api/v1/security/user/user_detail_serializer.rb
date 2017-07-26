class Api::V1::Security::User::UserDetailSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :email, :phone_number, :address,
    :first_name, :middle_name, :last_name, :profile_image, :birthday,
    :about, :signature, :facebook, :gmail, :twitter

  belongs_to :country, serializer: Api::V1::CountrySerializer

  has_many :all_roles, key: :roles
end
