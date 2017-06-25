class Vndb::VoiceActress < ApplicationRecord
  belongs_to :person,    class_name: 'Vndb::Person', optional: true
  belongs_to :character
  belongs_to :novel
end
