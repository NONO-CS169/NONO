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

xlsx.each(venue_name: "DRAFT VENUE LIST", link:	"Hyperlink", location:	"Location", name:	"Person who added (name)", county:	"County", ptype:	"P Type", jtype:	"J Type", season:	"Season (Y/N/S)") do |venue|
  #puts venue
  Venue.create!(venue)
end
