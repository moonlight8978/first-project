class Vndb::Staff < ApplicationRecord
  belongs_to :person, class_name: 'Database::Person'
  belongs_to :novel
end
