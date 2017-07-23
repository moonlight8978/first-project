module Rateable
  extend ActiveSupport::Concern

  included do
    has_many :ratings,  class_name: 'Feature::Rating',  as: :rateable do
      def avg
        self.inject(0) { |sum, rating| sum + rating.star }
          .fdiv(self.size)
          .round(2)
      end

      def detail
        self
      end

      def statistics
        data = self.group_by(&:star).map { |key, val| [key, val.size] }.to_h
        data_full = {}
        (1..10).each { |star| data_full[star] = 0 }
        data_full.merge(data).map do |star, count|
          { star: star, count: count }
        end
      end
    end
  end
end
