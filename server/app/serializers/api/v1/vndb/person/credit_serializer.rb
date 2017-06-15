class Api::V1::Vndb::Person::CreditSerializer < ActiveModel::Serializer
  attributes :novel_title, :novel_title_en, :position, :note,
    :alias, :alias_en, :released

  def novel_title
    object.novel.title
  end

  def novel_title_en
    object.novel.title_en
  end

  def released
    first_release = object.novel.first_release
    first_release && first_release.released
  end
end
