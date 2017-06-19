class Vgmdb::Classification < ApplicationRecord
  has_and_belongs_to_many :albums,
    join_table: :vgmdb_albums_vgmdb_classifications
end
