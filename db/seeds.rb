# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'roo'
path = Rails.root.join('db', 'test.xlsx').to_s
xlsx = Roo::Spreadsheet.open path

@user = User.find_or_initialize_by(email: 'user1@gmail.com')
@user.update_attributes(
    email: 'user1@gmail.com',
    password: 'password',
    password_confirmation: 'password',
)

Affinity.create("name": "Child Friendly")
Affinity.create("name": "LGBTQIA")
Affinity.create("name": "Veterans")

xlsx.each(venue_name: "DRAFT VENUE LIST", location:	"Location", name:	"Person who added (name)", county: "County", ptype:	"P Type", jtype:	"J Type", season: "Season (Y/N/S)", link:	"Hyperlink") do |venue|
  # venue = venue.merge({rating: 1 + rand(5)})
  # puts venue
  v = Venue.create(venue)
  Review.create(votes: 20, venue_id: v.id, user_id: @user.id, included_audience_stars: 5, included_audience_text: "cool",
                           programming_representation_stars: 5, programming_representation_text: "cool", food_representation_stars: 3,
                           food_representation_text: "cool", personal_comfort_stars: 3, personal_comfort_text: "cool", staff_comfort_stars: 4,
                           staff_comfort_text: "cool", cast_representation_stars: 3, cast_representation_text: "cool", whole_venue_stars: 4,
                           whole_venue_text: "cool", show_overview_stars: 3, show_overview_text: "cool", affinity: "Child Friendly")
  Review.create(votes: 20, venue_id: v.id, user_id: @user.id, included_audience_stars: 5, included_audience_text: "cool",
                           programming_representation_stars: 5, programming_representation_text: "cool", food_representation_stars: 3,
                           food_representation_text: "cool", personal_comfort_stars: 3, personal_comfort_text: "cool", staff_comfort_stars: 4,
                           staff_comfort_text: "cool", cast_representation_stars: 3, cast_representation_text: "cool", whole_venue_stars: 4,
                           whole_venue_text: "cool", show_overview_stars: 3, show_overview_text: "cool", affinity: "Child Friendly")
  Review.create(votes: 20, venue_id: v.id, user_id: @user.id, included_audience_stars: 5, included_audience_text: "cool",
                           programming_representation_stars: 5, programming_representation_text: "cool", food_representation_stars: 3,
                           food_representation_text: "cool", personal_comfort_stars: 3, personal_comfort_text: "cool", staff_comfort_stars: 4,
                           staff_comfort_text: "cool", cast_representation_stars: 3, cast_representation_text: "cool", whole_venue_stars: 4,
                           whole_venue_text: "cool", show_overview_stars: 3, show_overview_text: "cool", affinity: "Child Friendly")
end

# venues = [{:venue_name => 'UC Berkeley', :location => 'Berkeley', :description => '#1 Public University in the United States', season: "Season (Y/N/S)"},
#     	   {:venue_name => 'Stanford', :location => 'Stanford', :description => 'Not the #1 Public University in the United States', season: "Season (Y/N/S)"},
#          {:venue_name => 'Thai Basil', :location => 'Berkeley', :description => 'Affordable, authentic Thai food', season: "Season (Y/N/S)"},
#          {:venue_name => 'Wheeler Hall', :location => 'Berkeley', :description => 'Lecture hall at UC Berkeley', season: "Season (Y/N/S)"}
#   	 ]

# venues.each do |venue|
#   v = Venue.create!(venue)
#   Review.create(stars: 5, text: "Amazing", venue_id: v.id, user_id: @user.id, votes: 20)
#   Review.create(stars: 4, text: "Okay", venue_id: v.id, user_id: @user.id, votes: 10)
#   Review.create(stars: 2, text: "Terrible", venue_id: v.id, user_id: @user.id, votes: 0)
# end
