class PlacesController < ApplicationController
  def index
    if(params.has_key?(:location))
      @location = params.fetch("location")
    end
    if(params.has_key?(:itinerary_id))
      @current_itinerary_id = params.fetch("itinerary_id")
    end

    render("place_templates/index.html.erb")
  end
  
  def results
    if(params.has_key?(:itinerary_id))
      @current_itinerary_id = params.fetch("itinerary_id")
    end

    api_auth_header = { 'Authorization' => 'Bearer ' + ENV.fetch('YELP_API_KEY') }
    base_url = 'https://api.yelp.com/v3/businesses/search'
    @location = params.fetch("location")
    @term = params.fetch("term")
    
    if @term == "Active Life" 
      @cat = "active, All"
    elsif @term == "Arts & Entertainment"
      @cat = "arts, All"
    elsif @term == "Beauty & Spas"
      @cat = "beautysvc, All"
    elsif @term == "Campgrounds"
      @cat = "campgrounds, All"
    elsif @term == "Tours"
      @cat = "tours, All"
    elsif @term == "Nightlife"
      @cat = "nightlife, All"
    elsif @term == "Dance Clubs"
      @cat = "danceclubs, All"
    elsif @term == "Shopping"
      @cat = "shopping, All"
    end
    
    query_string = '?location=' + @location + '&categories=' + @cat.to_s

    api_response = HTTParty.get(base_url + query_string, headers: api_auth_header)
    @parsed_data = JSON.parse(api_response.body)

    render("place_templates/results.html.erb")
  end

  def show
    @place = Place.find(params.fetch("id_to_display"))

    render("place_templates/show.html.erb")
  end


  def edit_form
    @place = Place.find(params.fetch("prefill_with_id"))

    render("place_templates/edit_form.html.erb")
  end

  def update_row
    @place = Place.find(params.fetch("id_to_modify"))

    @place.place_name = params.fetch("place_name")
    @place.place_address = params.fetch("place_address")
    @place.place_description = params.fetch("place_description")
    @place.place_rating = params.fetch("place_rating")
    @place.place_link = params.fetch("place_link")
    @place.place_pic = params.fetch("place_pic")

    if @place.valid?
      @place.save

      redirect_to("/places/#{@place.id}", :notice => "Place updated successfully.")
    else
      render("place_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @place = Place.find(params.fetch("id_to_remove"))

    @place.destroy

    redirect_to("/places", :notice => "Place deleted successfully.")
  end
end
