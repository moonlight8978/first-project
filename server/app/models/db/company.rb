class Db::Company < ApplicationRecord
  validates :name,
    presence: true
  validates :link,
    if: -> { self.link },
    format: { with: /\Ahttp\:\/\/|https\:\/\//,
              message: 'Must be URL http://... or https://...' }
  validates :country,
    if: -> { self.country_id || self.country },
    presence: true

  belongs_to :country, class_name: 'Country', optional: true

  has_and_belongs_to_many :developeds, class_name: 'Db::Novel::Release',
    join_table: :db_developers_novel_releases

  has_and_belongs_to_many :publisheds, class_name: 'Db::Vndb::Release',
    join_table: :db_publishers_novel_releases
end
