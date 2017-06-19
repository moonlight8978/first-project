class Vgmdb::Album < ApplicationRecord
  belongs_to :product, class_name: 'Bussiness::Product', optional: true
  belongs_to :novel,   class_name: 'Vndb::Novel',        optional: true
  belongs_to :format

  has_many :discs

  has_and_belongs_to_many :classifications,
    join_table: :vgmdb_albums_vgmdb_classifications
end
