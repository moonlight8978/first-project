class Db::Novel::Staff < ApplicationRecord
  before_save :standardized

  validates :position,
    presence: true,
    inclusion: { in: %w(vocals composer artist scenario staff) }

  belongs_to :person, class_name: 'Db::Person'
  belongs_to :novel

private

  def standardized
    text_field = %w(position note alias alias_en)
    text_field.map do |key|
      self[key].strip!
      self[key].gsub!(/ +/, ' ')
      self.position.capitalize
    end
  end
end
