class Vndb::Tag < ApplicationRecord
  has_and_belongs_to_many :novels, join_table: :vndb_novels_vndb_tags
end
