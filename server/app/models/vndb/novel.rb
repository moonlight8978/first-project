class Vndb::Novel < ApplicationRecord
  has_many :companies, through: :publishers
  has_many :publishers
  has_many :characters

  searchable do
    text :title
    text :original_title do
      NetworkKanjiFilter.to_hiragana(original_title)
    end
  end
end
