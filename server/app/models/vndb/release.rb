class Vndb::Release < ApplicationRecord
  belongs_to :platform

  has_and_belongs_to_many :novels,
    join_table: :vndb_novels_vndb_releases
  has_and_belongs_to_many :developers,
    class_name: 'Company', join_table: :vndb_developeds_vndb_developers
  has_and_belongs_to_many :publishers,
    class_name: 'Company', join_table: :vndb_publisheds_vndb_publishers

  scope :released_asc, -> { order(released: :asc) }
end
