class Vgmdb::Staff < ApplicationRecord
  belongs_to :person, class_name: 'Database::Person'
  belongs_to :song
end
