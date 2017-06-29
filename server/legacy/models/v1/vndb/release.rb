class Vndb::Release < ApplicationRecord
  belongs_to :platform

  has_and_belongs_to_many :novels,
    join_table: :vndb_novels_vndb_releases
  has_and_belongs_to_many :developers, class_name: 'Database::Company',
    join_table: :database_developers_vndb_developeds
  has_and_belongs_to_many :publishers, class_name: 'Database::Company',
    join_table: :database_developers_vndb_developeds

  scope :released_asc, -> { order(released: :asc) }
end
