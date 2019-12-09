class ChangeReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :stars
    remove_column :reviews, :text
    add_column :reviews, :included_audience_stars, :integer
    add_column :reviews, :included_audience_text, :text
    add_column :reviews, :programming_representation_stars, :integer
    add_column :reviews, :programming_representation_text, :text
    add_column :reviews, :food_representation_stars, :integer
    add_column :reviews, :food_representation_text, :text
    add_column :reviews, :personal_comfort_stars, :integer
    add_column :reviews, :personal_comfort_text, :text
    add_column :reviews, :staff_comfort_stars, :integer
    add_column :reviews, :staff_comfort_text, :text
    add_column :reviews, :cast_representation_stars, :integer
    add_column :reviews, :cast_representation_text, :text
    add_column :reviews, :whole_venue_stars, :integer
    add_column :reviews, :whole_venue_text, :text
    add_column :reviews, :show_overview_stars, :integer
    add_column :reviews, :show_overview_text, :text
  end
end
