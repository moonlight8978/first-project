class Db::Novel::Release < ApplicationRecord
  before_save :standardized

  validates :status,
    presence: true,
    inclusion: { in: %w(trial complete) }
  validates :voiced,
    allow_nil: true,
    inclusion: { in: %w(no partial fully) }
  validates :animation_story,
    allow_nil: true,
    inclusion: { in: %w(no simple) }
  validates :animation_ero,
    allow_nil: true,
    inclusion: { in: %w(no simple) }
  validates :platform,
    if: -> { self.platform_id || self.platform },
    presence: true

  enum status: [:trial, :complete]
  enum voiced: [:no, :partial, :fully]
  enum animation_story: [:no, :simple], _prefix: :animation_story
  enum animation_ero:   [:no, :simple], _prefix: :animation_ero

  belongs_to :platform, optional: true

  has_and_belongs_to_many :novels,
    join_table: :db_novels_novel_releases
  has_and_belongs_to_many :developers, class_name: 'Db::Company',
    join_table: :db_developers_novel_releases
  has_and_belongs_to_many :publishers, class_name: 'Db::Company',
    join_table: :db_publishers_novel_releases

  scope :released_asc, -> { order(released: :asc) }

private
  def standardized
    self.jan_num.upcase!
  end
end
