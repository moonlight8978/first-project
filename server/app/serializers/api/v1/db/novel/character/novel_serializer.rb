class Api::V1::Db::Novel::Character::NovelSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_en
end