class Db::Novel::Tag < ApplicationRecord
  before_save :standardized

  validates :tag,
    presence: true,
    uniqueness: { message: 'Tag name must be unique!' }

  validates :tag_en,
    if: -> { tag_en },
    uniqueness: { message: 'Tag name (En) must be unique!' }

  has_and_belongs_to_many :novels, join_table: :db_novels_novel_tags

  searchable do
    text :tag_en
    text :tag do
      NetworkKanjiFilter.to_hiragana(tag)
    end
  end

private

  def standardized
    text_field = %w(tag tag_en description description_en)
    text_field.map do |key|
      self[key] && self[key].strip! && self[key].gsub!(/ +/, ' ')
    end
  end
end
