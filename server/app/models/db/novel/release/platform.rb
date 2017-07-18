class Db::Novel::Release::Platform < ApplicationRecord
  has_many :releases, dependent: :nullify
end
