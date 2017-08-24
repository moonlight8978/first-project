class Api::V1::Db::Company::CompanyDetailSerializer < ActiveModel::Serializer
  attributes :id
  
  has_many :developeds, serializer: Api::V1::Db::Company::ReleaseSerializer
  has_many :publisheds, serializer: Api::V1::Db::Company::ReleaseSerializer
  
  belongs_to :country, serializer: Api::V1::CountrySerializer
end
