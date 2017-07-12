class Db::Novel::Tag < ApplicationRecord
  before_save :standardized

  validates :tag,
    presence: true

  has_and_belongs_to_many :novels, join_table: :db_novels_novel_tags

private

  def standardized
    text_field = %w(tag tag_en description description_en)
    text_field.map do |key|
      self[key].strip!
      self[key].gsub!(/ +/, ' ')
    end
  end
end
