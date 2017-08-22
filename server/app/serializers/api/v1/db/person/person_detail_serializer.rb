class Api::V1::Db::Person::PersonDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :name_en, :gender, :birthday_day, :birthday_month,
    :birthday_year, :link, :twitter, 
    :voice_actress_statistics, :staff_statistics
  
  belongs_to :country, serializer: Api::V1::CountrySerializer
  
  has_many :staffs, serializer: Api::V1::Db::Person::StaffSerializer do
    object.staffs.sort_by do |staff| 
      staff.novel.first_release.released 
    end
  end
  
  has_many :voice_actresses, 
    serializer: Api::V1::Db::Person::VoiceActressSerializer do
    # block
    object.voice_actresses.reject do |va| 
      va.character_novel.novel.first_release.nil? 
    end.sort_by do |va| 
      va.character_novel.novel.first_release.released 
    end + object.voice_actresses.select do |va|
      va.character_novel.novel.first_release.nil?
    end
  end
end
