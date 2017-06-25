class Db::Novel::Tag < ApplicationRecord
  has_and_belongs_to_many :novels, join_table: :db_novels_novel_tags
end
