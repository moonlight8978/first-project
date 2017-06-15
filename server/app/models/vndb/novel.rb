class Vndb::Novel < ApplicationRecord
  voiced = { none: 0, partial: 1, fully: 2 }

  belongs_to :product, class_name: 'Bussiness::Product', optional: true

  has_many :releases, -> { released_asc }
  has_many :characters
  has_many :staffs
  has_many :people, through: :staffs

  has_and_belongs_to_many :tags, join_table: :vndb_novels_vndb_tags

  # searchable do
  #   text :title
  #   text :original_title do
  #     NetworkKanjiFilter.to_hiragana(original_title)
  #   end
  # end

  def first_release
    self.releases.where(status: 1).first
  end
end
