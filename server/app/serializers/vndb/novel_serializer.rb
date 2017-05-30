class Vndb::NovelSerializer < ActiveModel::Serializer
  attributes :id, :title, :original_title
  has_many :characters
end
