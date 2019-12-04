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

xlsx.each(venue_name: "DRAFT VENUE LIST", location:	"Location", name:	"Person who added (name)", county: "County", ptype:	"P Type", jtype:	"J Type", season: "Season (Y/N/S)", link:	"Hyperlink") do |venue|
  # venue = venue.merge({rating: 1 + rand(5)})
  # puts venue
  v = Venue.create(venue)
  Review.create(stars: 5, text: "Amazing", venue_id: v.id, user_id: @user.id, votes: 20)
  Review.create(stars: 4, text: "Okay", venue_id: v.id, user_id: @user.id, votes: 10)
  Review.create(stars: 2, text: "Terrible", venue_id: v.id, user_id: @user.id, votes: 0)
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
