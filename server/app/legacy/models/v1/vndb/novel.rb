class Vndb::Novel < ApplicationRecord
  attr_accessor :full_info
  attr_accessor :characters_grouped, :producers, :staffs_grouped

  voiced = { none: 0, partial: 1, fully: 2 }
  STATUS = { trial: 0, completed: 1 }

  has_many :albums,          class_name: 'Vgmdb::Album'
  has_many :screenshots
  has_many :staffs
  has_many :voice_actresses

  has_many :characters,                                 through: :voice_actresses
  has_many :people,     class_name: 'Database::Person', through: :staffs

  has_many :comments, class_name: 'Feature::Comment', as: :commentable
  has_many :ratings,  class_name: 'Feature::Rating',  as: :rateable

  has_and_belongs_to_many :releases, -> { released_asc },
    join_table: :vndb_novels_vndb_releases
  has_and_belongs_to_many :tags,
    join_table: :vndb_novels_vndb_tags
  has_and_belongs_to_many :platforms,
    join_table: :vndb_novels_vndb_platforms

  # searchable do
  #   text :title do
  #     NetworkKanjiFilter.to_hiragana(title)
  #   end
  #   text :title_en
  # end

  def first_release
    self.releases.where(status: STATUS[:completed]).first
  end
end
