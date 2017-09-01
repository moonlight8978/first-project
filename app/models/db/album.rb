class Db::Album < ApplicationRecord
  validates :title, 
    presence: { message: 'タイトルを空にすることはできません。' }
  validates :title_en,
    presence: { message: 'タイトル（英語／ローマ字）を空にすることはできません。' }
  validates :title_pronounce,
    presence: { message: 'タイトル（発音）を空にすることはできません。' }
  validates :image, 
    if: -> { image },
    format: { with: /\Ahttp\:\/\/|https\:\/\//,
              message: 'URL（http://... or https://...）を入力してください。' }
  validates :image,
    if: -> { image },
    format: { with: /.jpg|.png|.jpeg\Z/,
              message: '写真は(.jpg/.png/,jpeg)が許可されます。' }
              
  # default_scope { order(title_pronounce: :asc) }
  searchable do
    text :title, stored: true
    text :title_en
    text :title_pronounce
    string :title_pronounce
  end
end
