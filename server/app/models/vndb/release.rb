class Vndb::Release < ApplicationRecord
  belongs_to :novel

  has_many :publishers
  has_many :companies, through: :publishers
  # class_name: 'Company'
  # has_many :developers
  # has_many :developed_by, class_name: 'Company', through: :developers
end
