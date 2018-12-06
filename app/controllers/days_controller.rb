class DaysController < ApplicationController
  def index
    @days = Day.all

    render("day_templates/index.html.erb")
  end

  def show
    @day = Day.find(params.fetch("id_to_display"))

    render("day_templates/show.html.erb")
  end

  def new_form
    @day = Day.new

    render("day_templates/new_form.html.erb")
  end

  def create_row
    @day = Day.new

    @day.itinerary_id = params.fetch("itinerary_id")

    if @day.valid?
      @day.save

      redirect_back(:fallback_location => "/days", :notice => "Day created successfully.")
    else
      render("day_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @day = Day.find(params.fetch("prefill_with_id"))

    render("day_templates/edit_form.html.erb")
  end

  def update_row
    @day = Day.find(params.fetch("id_to_modify"))

    @day.itinerary_id = params.fetch("itinerary_id")

    if @day.valid?
      @day.save

      redirect_to("/days/#{@day.id}", :notice => "Day updated successfully.")
    else
      render("day_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @day = Day.find(params.fetch("id_to_remove"))

    @day.destroy

    redirect_to("/days", :notice => "Day deleted successfully.")
  end
end
