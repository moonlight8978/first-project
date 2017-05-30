class Vndb::VoiceActress < ApplicationRecord
  belongs_to :person
  belongs_to :character
end
