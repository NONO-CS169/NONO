class VenuesController < ApplicationController

  def venue_params
    params.require(:venue).permit(:venue_name, :hyperlink, :location, :person_added, :county, :p_type, :j_type, :season, :notes)
  end

  def show
    id = params[:id] # retrieve venue ID from URI route
    @venue = Venue.find(id) # look up venue by unique ID
    # will render app/views/venues/show.<extension> by default
  end

  def index
    @all_locations = Venue.all_locations
    sort_by = params[:sort] || session[:sort]
    session[:sort] = sort_by
    if sort_by
      @venues = Venue.order(sort_by)
      @table_header = 'hilite' if sort_by == 'venue_name'
    end

    if params.keys.include? "locations"
      if params[:locations].is_a? Hash
        @locations = params[:locations].keys 
      end
      if params[:locations].is_a? Array
        @locations = params[:locations] 
      end
    elsif session.keys.include? "locations"
      @locations = session[:locations]
    else
      @locations = @all_locations
    end
    session[:locations] = @locations
    flash.keep
    if ! ((params.keys.include? 'sort') || (params.keys.include? 'locations'))
      #redirect_to venues_path(:sort => session[:sort], :locations => session[:locations])
    end
    @venues = Venue.where(:location => @locations).order(sort_by)
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
