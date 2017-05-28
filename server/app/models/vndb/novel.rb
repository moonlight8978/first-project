class Vndb::Novel < ApplicationRecord
  has_many :companies, through: :publishes
  has_many :publishes
end
