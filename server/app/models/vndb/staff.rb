class Vndb::Staff < ApplicationRecord
  belongs_to :person
  belongs_to :novel
end
