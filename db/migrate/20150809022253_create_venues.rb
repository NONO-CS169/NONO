class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      # t.string :venue_name
      # t.string :rating
      # t.text :description
      # t.text :location

      t.string :venue_name 
      t.string :link
      t.string :location 
      t.string :name  
      t.string :county 
      t.string :ptype 
      t.string :jtype
      t.string :season
      # Add fields that let Rails automatically keep track
      # of when venues are added or modified:
      t.timestamps
    end
  end
end
