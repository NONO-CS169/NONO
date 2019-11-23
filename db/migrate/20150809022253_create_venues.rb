class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :venue_name
      t.string :rating
      t.text :description
      t.text :location
      # Add fields that let Rails automatically keep track
      # of when venues are added or modified:
      t.timestamps
    end
  end
end
