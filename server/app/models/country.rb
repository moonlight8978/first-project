class Country < ApplicationRecord
  before_save :standardized

  validates :name, :name_en, :code,
    presence: true

  has_many :people,    dependent: :nullify,
    class_name: 'Db::Person'
  has_many :companies, dependent: :nullify,
    class_name: 'Db::Company'

private

  def standardized
    self.code.gsub(/\s+/, '').downcase
  end
end
