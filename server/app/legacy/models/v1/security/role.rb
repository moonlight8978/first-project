class Security::Role < ApplicationRecord
  has_and_belongs_to_many :users,
    join_table: 'security_roles_security_users'
end
