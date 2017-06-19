class Api::V1::Vndb::Novel::StaffSerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :note, :position, :alias, :alias_en

  attribute :id do
    object.person.id
  end

  attribute :name do
    object.person.name
  end

  attribute :name_en do
    object.person.name_en
  end
end
