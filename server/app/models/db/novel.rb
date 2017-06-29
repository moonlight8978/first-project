class Db::Novel < ApplicationRecord
  attr_accessor :full_info
  attr_accessor :characters_grouped, :producers, :staffs_grouped

  enum length: [:very_short, :short, :medium, :long, :very_long]

  has_many :albums,          class_name: 'Db::Album'
  has_many :screenshots
  has_many :staffs
  has_many :voice_actresses, class_name: 'Db::Novel::Character::VoiceActress'

  has_many :characters,                           through: :voice_actresses
  has_many :people,     class_name: 'Db::Person', through: :staffs

  has_many :comments, class_name: 'Feature::Comment', as: :commentable
  has_many :ratings,  class_name: 'Feature::Rating',  as: :rateable

  has_and_belongs_to_many :releases, -> { released_asc },
    join_table: :db_novels_novel_releases
  has_and_belongs_to_many :tags,
    join_table: :db_novels_novel_tags

  searchable do
    text :title do
      NetworkKanjiFilter.to_hiragana(title)
    end
    text :title_en
  end

  def first_release
    self.releases.where(status: :complete).first
  end
end
