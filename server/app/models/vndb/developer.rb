class Vndb::Developer < ApplicationRecord
  belongs_to :company
  belongs_to :release
end
