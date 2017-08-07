class Db::Novel < ApplicationRecord
  include Rateable
  include Reviewable

  after_initialize :default_values
  before_save :standardized

  validates :title, :title_en, presence: true
  validates :length, inclusion: { in: %w(very_short short medium long very_long) }
  validates :image, presence: true,
    format: { with: /\Ahttp\:\/\/|https\:\/\//,
              message: 'Must be URL http://... or https://...' }
  validates :image,
    format: { with: /.jpg|.png|.jpeg\Z/,
              message: 'Image must be one of following type: .jpg, .png or .jpeg' }

  attr_accessor :full_info
  attr_accessor :characters_grouped, :staffs_grouped

  enum length: [:very_short, :short, :medium, :long, :very_long]

  has_many :albums,          class_name: 'Db::Album'
  has_many :screenshots
  has_many :staffs
  has_many :character_novels

  has_many :characters,                           through: :character_novels
  has_many :people,     class_name: 'Db::Person', through: :staffs

  has_many :comments, class_name: 'Feature::Comment', as: :commentable

  has_and_belongs_to_many :releases, -> { released_asc },
    join_table: :db_novels_novel_releases,
    after_add: :reindex
  has_and_belongs_to_many :tags,
    join_table: :db_novels_novel_tags,
    after_add: :reindex

  searchable do
    text :title do
      NetworkKanjiFilter.to_hiragana(title)
    end
    text :title_en
    string :title_sort do
      NetworkKanjiFilter.to_hiragana(title.downcase.gsub(/[^\d\w\s]/, ''))
    end
    integer :tag_ids,     references: Db::Novel::Tag,     multiple: true
    integer :release_ids, references: Db::Novel::Release, multiple: true
  end

  def first_release
    self.releases.select { |release| release.status == 'complete' }.first
  end

  def producers
    releases.map(&:producers).flatten.uniq(&:id)
  end

private

  def standardized
    text_fields = [:title, :title_en, :description, :description_en]
    text_fields.map do |key|
      return unless self[key]
      self[key].strip!
      self[key].gsub!(/ +/, ' ')
    end
  end

  def default_values
    self.image_nsfw ||= false
  end

  def reindex(object)
    Sunspot.index!(self)
  end
end
