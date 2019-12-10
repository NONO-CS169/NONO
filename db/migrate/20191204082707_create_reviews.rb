class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :text
      t.integer :votes
      t.references :venue, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
