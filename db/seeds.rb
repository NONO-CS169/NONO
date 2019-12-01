# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

venues = [{:venue_name => 'UC Berkeley', :rating => 5, :location => 'Berkeley', :description => '#1 Public University in the United States'},
    	   {:venue_name => 'Stanford', :rating => 0, :location => 'Stanford', :description => 'Not the #1 Public University in the United States'},
         {:venue_name => 'Thai Basil', :rating => 4.6, :location => 'Berkeley', :description => 'Affordable, authentic Thai food'},
         {:venue_name => 'Wheeler Hall', :rating => 3.3, :location => 'Berkeley', :description => 'Lecture hall at UC Berkeley'}
  	 ]

venues.each do |venue|
  Venue.create!(venue)
end
