class Db::Novel::CharacterNovel < ApplicationRecord
  has_many :voice_actresses, class_name: 'Db::Novel::Character::VoiceActress'

  has_many :people, through: :voice_actresses,
    class_name: 'Db::Novel::Character::VoiceActress'

  belongs_to :novel,     class_name: 'Db::Novel'
  belongs_to :character
end
