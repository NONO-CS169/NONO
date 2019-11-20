# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

venues = [{:venue_name => 'UC Berkeley', :rating => 5, :location => 'Berkeley'},
    	   {:venue_name => 'Stanford', :rating => 0, :location => 'Stanford because obligatory Stanford joke'},
         {:venue_name => "Oski's Place", :rating => 5, :location => 'Unknown'}
  	 ]

venues.each do |venue|
  Venue.create!(venue)
end
