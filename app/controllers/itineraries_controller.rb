class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.where(user_id: current_user.id).all
    render("itinerary_templates/index.html.erb")
  end

  def show
    @itinerary = Itinerary.find(params.fetch("id_to_display"))

    render("itinerary_templates/show.html.erb")
  end
  
  def new_form
    @itinerary = Itinerary.new

    render("itinerary_templates/new_form.html.erb")
  end

  def create_row
    @itinerary = Itinerary.new

    @itinerary.user_id = params.fetch("user_id")
    @itinerary.name_of_trip = params.fetch("name_of_trip")
    @itinerary.location_of_trip = params.fetch("location_of_trip")
    @itinerary.days_in_trip = params.fetch("days_in_trip")

    if @itinerary.days_in_trip == 0
      flash[:notice] = 'Please input an integer number of days.'
      redirect_back fallback_location: 'itineraries/new'
    elsif @itinerary.valid?
      @itinerary.save
      
      flash.now[:notice] = "Itinerary created successfully. Now you can start adding things to " + @itinerary.name_of_trip + "!"
      render("itinerary_templates/show.html.erb")
    else
      render("itinerary_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @itinerary = Itinerary.find(params.fetch("prefill_with_id"))

    render("itinerary_templates/edit_form.html.erb")
  end

  def update_row
    @itinerary = Itinerary.find(params.fetch("id_to_modify"))

    @itinerary.user_id = params.fetch("user_id")
    @itinerary.name_of_trip = params.fetch("name_of_trip")

    if @itinerary.valid?
      @itinerary.save

      redirect_to("/itineraries/#{@itinerary.id}", :notice => "Itinerary updated successfully.")
    else
      render("itinerary_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @itinerary = Itinerary.find(params.fetch("id_to_remove"))

    @itinerary.destroy

    redirect_to("/itineraries", :notice => "Itinerary deleted successfully.")
  end
end
