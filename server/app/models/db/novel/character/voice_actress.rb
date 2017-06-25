class Db::Novel::Character::VoiceActress < ApplicationRecord
  belongs_to :person,    class_name: 'Db::Person', optional: true
  belongs_to :character
  belongs_to :novel,     class_name: 'Db::Novel'
end
