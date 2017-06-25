class Db::Novel::Release < ApplicationRecord
  belongs_to :platform

  has_and_belongs_to_many :novels,
    join_table: :db_novels_novel_releases
  has_and_belongs_to_many :developers, class_name: 'Db::Company',
    join_table: :db_developers_novel_releases
  has_and_belongs_to_many :publishers, class_name: 'Db::Company',
    join_table: :db_publishers_novel_releases

  scope :released_asc, -> { order(released: :asc) }
end
