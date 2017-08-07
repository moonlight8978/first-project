class CreateFeatureReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :feature_reviews do |t|
      t.references :reviewable, polymorphic: true, index: true
      t.belongs_to :user,                          index: true
      t.string     :title
      t.text       :body

      t.timestamps
    end
  end
end
