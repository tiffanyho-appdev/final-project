class RestaurantsController < ApplicationController
  def index
    if(params.has_key?(:location))
      @location = params.fetch("location")
    end
    render("restaurant_templates/index.html.erb")
  end

  def results
    api_auth_header = { 'Authorization' => 'Bearer ' + ENV.fetch('YELP_API_KEY') }
    base_url = 'https://api.yelp.com/v3/businesses/search'
    @location = params.fetch("location")
    @term = params.fetch("term")
    query_string = '?term=' + @term + '&' + 'location=' + @location

    api_response = HTTParty.get(base_url + query_string, headers: api_auth_header)
    @parsed_data = JSON.parse(api_response.body)
    
    render("restaurant_templates/results.html.erb")
  end

  # def new_form
  #   @restaurant = Restaurant.new

  #   render("restaurant_templates/new_form.html.erb")
  # end

  def create_row
    @restaurant = Restaurant.new

    @restaurant.rest_name = params.fetch("rest_name")
    @restaurant.rest_address = params.fetch("rest_address")
    @restaurant.rest_genre = params.fetch("rest_genre")
    @restaurant.rest_rating = params.fetch("rest_rating")
    @restaurant.rest_link = params.fetch("rest_link")
    @restaurant.rest_pic = params.fetch("rest_pic")
    @restaurant.rest_menu = params.fetch("rest_menu")

    if @restaurant.valid?
      @restaurant.save

      redirect_back(:fallback_location => "/restaurants", :notice => "Restaurant created successfully.")
    else
      render("restaurant_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @restaurant = Restaurant.find(params.fetch("prefill_with_id"))

    render("restaurant_templates/edit_form.html.erb")
  end

  def update_row
    @restaurant = Restaurant.find(params.fetch("id_to_modify"))

    @restaurant.rest_name = params.fetch("rest_name")
    @restaurant.rest_address = params.fetch("rest_address")
    @restaurant.rest_genre = params.fetch("rest_genre")
    @restaurant.rest_rating = params.fetch("rest_rating")
    @restaurant.rest_link = params.fetch("rest_link")
    @restaurant.rest_pic = params.fetch("rest_pic")
    @restaurant.rest_menu = params.fetch("rest_menu")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully.")
    else
      render("restaurant_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @restaurant = Restaurant.find(params.fetch("id_to_remove"))

    @restaurant.destroy

    redirect_to("/restaurants", :notice => "Restaurant deleted successfully.")
  end
end
