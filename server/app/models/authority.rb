class Authority < ApplicationRecord
  belongs_to :user
  belongs_to :role

  attr_accessor :role
end
