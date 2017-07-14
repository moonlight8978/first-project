class Api::V1::Db::Novel::Character::CharacterDetailSerializer < ActiveModel::Serializer
  unknown = '不明'

  attributes :id, :name, :name_en, :weight, :height, :blood_type,
    :bust, :waist, :hips, :image, :gender, :description, :description_en, :role

  has_many :character_novels, key: :novels
end
