class Api::V1::Db::Person::PersonListSerializer < ActiveModel::Serializer
  attributes :id, :name, :name_en, :gender, :birthday_day, :birthday_month,
    :birthday_year, :link, :twitter

  belongs_to :country, serializer: Api::V1::CountrySerializer
end
