class Vgmdb::Staff < ApplicationRecord
  belongs_to :person, class_name: 'Vndb::Person'
  belongs_to :song
end
