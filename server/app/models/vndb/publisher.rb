class Vndb::Publisher < ApplicationRecord
  belongs_to :company
  belongs_to :release
end
