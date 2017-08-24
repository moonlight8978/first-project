class Api::V1::Db::Person::PersonDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :name_en, :gender, :birthday_day, :birthday_month,
    :birthday_year, :link, :twitter, :staff_positions, :aliases,
    :voice_actress_statistics, :staff_statistics
  
  belongs_to :country, serializer: Api::V1::CountrySerializer
  
  # has_many :staffs, serializer: Api::V1::Db::Person::StaffSerializer do
  #   object.staffs.sort_date
  # end
  # 
  # has_many :voice_actresses, serializer: Api::V1::Db::Person::VoiceActressSerializer do
  #   object.voice_actresses.sort_date
  # end
end
