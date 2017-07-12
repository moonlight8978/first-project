class Vgmdb::Song < ApplicationRecord
  has_many :staffs
  has_many :people, class_name: 'Database::Person', through: :staffs
end
