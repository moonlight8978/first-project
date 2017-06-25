class Database::Company < ApplicationRecord
  belongs_to :country, class_name: 'General::Country', optional: true

  has_and_belongs_to_many :developeds, class_name: 'Vndb::Release',
    join_table: :database_developers_vndb_developeds

  has_and_belongs_to_many :publisheds, class_name: 'Vndb::Release',
    join_table: :database_publishers_vndb_publisheds
end
