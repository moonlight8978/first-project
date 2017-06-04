class Vndb::Company < ApplicationRecord
  belongs_to :country, class_name: 'General::Country', optional: true

  has_and_belongs_to_many :developeds, class_name: 'Release',
    join_table: 'vndb_developeds_vndb_developers'

  has_and_belongs_to_many :publisheds, class_name: 'Release',
    join_table: 'vndb_publisheds_vndb_publishers'
end
