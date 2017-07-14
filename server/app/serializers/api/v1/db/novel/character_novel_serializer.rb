class Api::V1::Db::Novel::CharacterNovelSerializer < ActiveModel::Serializer
  attributes :character_novel_id, :id, :name, :name_en, :weight, :height, :blood_type,
    :bust, :waist, :hips, :birthday_month, :birthday_day, :image, :gender, :description,
    :description_en, :role

  has_many :voice_actresses, serializer: Api::V1::Db::Novel::Character::VoiceActressSerializer

  def character_novel_id
    object.id
  end

  def id
    object.character.id
  end

  def name
    object.character.name
  end

  def name_en
    object.character.name_en
  end

  def weight
    object.character.weight
  end

  def height
    object.character.height
  end

  def blood_type
    object.character.blood_type
  end

  def bust
    object.character.bust
  end

  def waist
    object.character.waist
  end

  def hips
    object.character.hips
  end

  def birthday_month
    object.character.birthday_month
  end

  def birthday_day
    object.character.birthday_day
  end

  def image
    object.character.image
  end

  def gender
    object.character.gender
  end

  def role
    object.character.role
  end

  def description
    object.character.description
  end

  def description_en
    object.character.description_en
  end
end
