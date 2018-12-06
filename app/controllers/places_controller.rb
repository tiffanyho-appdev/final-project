class PlacesController < ApplicationController
  def index
    @places = Place.all
    @location = 

    render("place_templates/index.html.erb")
  end

  def show
    @place = Place.find(params.fetch("id_to_display"))

    render("place_templates/show.html.erb")
  end

  # def new_form
  #   @place = Place.new

  #   render("place_templates/new_form.html.erb")
  # end

  # def create_row
  #   @place = Place.new

  #   @place.place_name = params.fetch("place_name")
  #   @place.place_address = params.fetch("place_address")
  #   @place.place_description = params.fetch("place_description")
  #   @place.place_rating = params.fetch("place_rating")
  #   @place.place_link = params.fetch("place_link")
  #   @place.place_pic = params.fetch("place_pic")

  #   if @place.valid?
  #     @place.save

  #     redirect_back(:fallback_location => "/places", :notice => "Place created successfully.")
  #   else
  #     render("place_templates/new_form_with_errors.html.erb")
  #   end
  # end

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
