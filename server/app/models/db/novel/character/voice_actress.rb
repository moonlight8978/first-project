class Db::Novel::Character::VoiceActress < ApplicationRecord
  belongs_to :person,          class_name: 'Db::Person'
  belongs_to :character_novel, class_name: 'Db::Novel::CharacterNovel'
end
