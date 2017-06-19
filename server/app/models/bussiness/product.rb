class Bussiness::Product < ApplicationRecord
  has_one :novel, class_name: 'Vndb::Novel'
  has_one :album, class_name: 'Vgmdb::Album'
  has_one :type
end
