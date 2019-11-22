class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :venue_name
      t.text :hyperlink
      t.text :location
      t.text :person_added
      t.text :county
      t.text :p_type
      t.text :j_type
      t.text :season
      t.text :notes
      # Add fields that let Rails automatically keep track
      # of when venues are added or modified:
      t.timestamps
    end
  end
end
