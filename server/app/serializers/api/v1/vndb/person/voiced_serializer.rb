class Api::V1::Vndb::Person::VoicedSerializer < ActiveModel::Serializer
  ROLE = ['Protagonist', 'Main character', 'Side character']

  attributes :id, :novel_title, :novel_title_en, :name, :name_en, :gender, :role,
    :alias, :alias_en, :released

  def id
    object.character.id
  end

  def novel_title
    object.character.novel.title
  end

  def novel_title_en
    object.character.novel.title_en
  end

  def name
    object.character.name
  end

  def name_en
    object.character.name_en
  end

  def gender
    object.character.gender
  end

  def role
    ROLE[object.character.role]
  end

  def released
    first_release = object.character.novel.first_release
    first_release && first_release.released
  end
end
