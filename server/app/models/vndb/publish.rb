class Vndb::Publish < ApplicationRecord
  belongs_to :company
  belongs_to :novel
end
