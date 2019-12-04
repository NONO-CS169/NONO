class VenuesController < ApplicationController

  def venue_params
    params.require(:venue).permit(:venue_name, :link, :location)
  end

  def show
    id = params[:id] # retrieve venue ID from URI route
    @venue = Venue.find(id) # look up venue by unique ID
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

        @venues = Venue.where("rating >= ? AND rating <= ?", minval,maxval).order(sort_by).paginate(page: params[:page], per_page: 10)
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
