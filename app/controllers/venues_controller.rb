class VenuesController < ApplicationController

  def venue_params
    params.require(:venue).permit(:venue_name, :link, :location, :season)
  end

  def show
    id = params[:id] # retrieve venue ID from URI route
    @venue = Venue.find(id) # look up venue by unique ID
    @reviews = @venue.reviews # venue's reviews
    @included_audience_stars_average = @reviews.length == 0 ? -1 : @reviews.average(:included_audience_stars)
    @programming_representation_stars_average = @reviews.length == 0 ? -1 : @reviews.average(:programming_representation_stars)
    @food_representation_stars_average = @reviews.length == 0 ? -1 : @reviews.average(:food_representation_stars)
    @personal_comfort_stars_average = @reviews.length == 0 ? -1 : @reviews.average(:personal_comfort_stars)
    @staff_comfort_stars_average = @reviews.length == 0 ? -1 : @reviews.average(:staff_comfort_stars)
    @cast_representation_stars_average = @reviews.length == 0 ? -1 : @reviews.average(:cast_representation_stars)
    @whole_venue_stars_average = @reviews.length == 0 ? -1 : @reviews.average(:whole_venue_stars)
    @show_overview_stars_average = @reviews.length == 0 ? -1 : @reviews.average(:show_overview_stars)
    # will render app/views/venues/show.<extension> by default
  end

  def index
        @all_ratings = ['1', '2', '3' ,'4', '5']
        sort_by = params[:sort] || session[:sort]
        session[:sort] = sort_by
        if sort_by
          @venues = Venue.order(sort_by)
          @table_header = 'hilite' if sort_by == 'venue_name'
        end

        if params.keys.include? "ratings"
          if params[:ratings].is_a? Hash
            @ratings = params[:ratings].keys
          end
          if params[:ratings].is_a? Array
            @ratings = params[:ratings]
          end
        elsif session.keys.include? "ratings"
          @ratings = session[:ratings]
        else
          @ratings = @all_ratings
        end
        session[:ratings] = @ratings
        flash.keep
        if ! ((params.keys.include? 'sort') || (params.keys.include? 'ratings'))
            redirect_to venues_path(:sort => session[:sort], :ratings => session[:ratings])
        end

        minval = @ratings.min
        maxval = @ratings.max

        @venues = Venue.order(sort_by).paginate(page: params[:page], per_page: 10)
        @review = Review.last
      #redirect_to venues_path
      return
  end

  def new
    # default: render 'new' template
  end

  def create
    @venue = Venue.create!(venue_params)
    flash[:notice] = "#{@venue.venue_name} was successfully created."
    redirect_to venues_path
  end

  def edit
    @venue = Venue.find params[:id]
  end

  def update
    @venue = Venue.find params[:id]
    @venue.update_attributes!(venue_params)
    flash[:notice] = "#{@venue.venue_name} was successfully updated."
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    flash[:notice] = "Venue '#{@venue.venue_name}' deleted."
    redirect_to venues_path
  end

end
