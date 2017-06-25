class Db::Company < ApplicationRecord
  belongs_to :country, class_name: 'Country', optional: true

  has_and_belongs_to_many :developeds, class_name: 'Db::Novel::Release',
    join_table: :db_developers_novel_releases

  has_and_belongs_to_many :publisheds, class_name: 'Db::Vndb::Release',
    join_table: :db_publishers_novel_releases
end
