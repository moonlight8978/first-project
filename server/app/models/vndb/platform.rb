class Vndb::Platform < ApplicationRecord
  has_and_belongs_to_many :novels, join_table: :vndb_novels_vndb_platforms
end
