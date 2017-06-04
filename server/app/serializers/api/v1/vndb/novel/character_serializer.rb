class Api::V1::Vndb::Novel::CharacterSerializer < ActiveModel::Serializer
  role = ['Protagonist', 'Main character', 'Side character']
  # role = ['主人公', '']
  # birthday_day = [
  #   'ゼロ', '一日', '二日', '三日', '四日', '五日', '六花', '七日', '八日', '九日',
  #   '十日', '十一日', '十二日', '十三日', '十四日', '十五日', '十六日', '十七日',
  #   '十八日', '十九日', '二十日', '二十一日', '二十二日', '二十三日', '二十四日',
  #   '二十五日', '二十六日', '二十七日', '二十八日', '二十九日', '三十日', '三十一日'
  # ]
  #
  # birthday_month = [
  #   '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月',
  #   '十一月', '十二月'
  # ]

  gender = { 'Female' => 0, 'Male' => 1 }

  attributes :id, :name, :original_name, :weight, :height, :blood_type, :image

  attribute :gender do
    gender[object.gender]
  end

  attribute :three_sizes do
    "#{object.bust}-#{object.waist}-#{object.hip}"
  end

  attribute :role do
    role[object.role]
  end

  attribute :birthday do
    "#{object.birthday_month}月#{object.birthday_day}日"
  end

  has_many :voice_actresses
end
