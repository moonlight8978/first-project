class Vndb::CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :original_name, :three_sizes
end
