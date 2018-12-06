class PlannedStaysController < ApplicationController
  def index
    @planned_stays = PlannedStay.all

    render("planned_stay_templates/index.html.erb")
  end

  def show
    @planned_stay = PlannedStay.find(params.fetch("id_to_display"))

    render("planned_stay_templates/show.html.erb")
  end

  def new_form
    @planned_stay = PlannedStay.new

    render("planned_stay_templates/new_form.html.erb")
  end

  def create_row
    @planned_stay = PlannedStay.new

    @planned_stay.hotel_id = params.fetch("hotel_id")
    @planned_stay.day_id = params.fetch("day_id")
    @planned_stay.order_in_day = params.fetch("order_in_day")

    if @planned_stay.valid?
      @planned_stay.save

      redirect_back(:fallback_location => "/planned_stays", :notice => "Planned stay created successfully.")
    else
      render("planned_stay_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @planned_stay = PlannedStay.find(params.fetch("prefill_with_id"))

    render("planned_stay_templates/edit_form.html.erb")
  end

  def update_row
    @planned_stay = PlannedStay.find(params.fetch("id_to_modify"))

    @planned_stay.hotel_id = params.fetch("hotel_id")
    @planned_stay.day_id = params.fetch("day_id")
    @planned_stay.order_in_day = params.fetch("order_in_day")

    if @planned_stay.valid?
      @planned_stay.save

      redirect_to("/planned_stays/#{@planned_stay.id}", :notice => "Planned stay updated successfully.")
    else
      render("planned_stay_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @planned_stay = PlannedStay.find(params.fetch("id_to_remove"))

    @planned_stay.destroy

    redirect_to("/planned_stays", :notice => "Planned stay deleted successfully.")
  end
end
