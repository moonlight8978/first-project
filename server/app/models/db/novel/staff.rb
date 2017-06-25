class Db::Novel::Staff < ApplicationRecord
  belongs_to :person, class_name: 'Db::Person'
  belongs_to :novel
end
