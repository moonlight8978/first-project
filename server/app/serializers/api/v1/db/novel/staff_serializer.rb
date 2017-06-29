class Api::V1::Db::Novel::StaffSerializer < ActiveModel::Serializer
  attributes :id, :person_id, :note, :position, :alias, :alias_en, :name, :name_en

  belongs_to :country, serializer: Api::V1::CountrySerializer do
    object.person.country
  end

  def name
    object.person.name
  end

  def name_en
    object.person.name_en
  end
end
