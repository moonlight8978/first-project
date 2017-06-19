class Vndb::VoiceActress < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :character
  belongs_to :novel
end
