class PlannedFunsController < ApplicationController
  def index
    @planned_funs = PlannedFun.all

    render("planned_fun_templates/index.html.erb")
  end

  def show
    @planned_fun = PlannedFun.find(params.fetch("id_to_display"))

    render("planned_fun_templates/show.html.erb")
  end

  def new_form
    @planned_fun = PlannedFun.new
   
    render("planned_fun_templates/new_form.html.erb")
  end

  def create_row
    @planned_fun = PlannedFun.new

    @planned_fun.place_id = params.fetch("yelpid")
    @planned_fun.day_id = params.fetch("day")
    @planned_fun.order_in_day = params.fetch("order_in_day")
    @planned_fun.itinerary_id = params.fetch("itinerary_id")
    
    if @planned_fun.day_id.to_i > Itinerary.where(id: @planned_fun.itinerary_id).first.days_in_trip.to_i
      flash[:notice] = 'That day does not exist in this itinerary. Please select an appropriate date'
      redirect_back fallback_location: 'places/results.html?itinerary_id=' + @planned_meal.itinerary_id.to_s
    elsif @planned_fun.valid?
      @planned_fun.save
      redirect_to("/itineraries/"+ @planned_fun.itinerary_id.to_s, :notice => "Planned fun created successfully.")
    end
  end

  def edit_form
    @planned_fun = PlannedFun.find(params.fetch("prefill_with_id"))

    render("planned_fun_templates/edit_form.html.erb")
  end

  def update_row
    @planned_fun = PlannedFun.find(params.fetch("id_to_modify"))

    @planned_fun.place_id = params.fetch("place_id")
    @planned_fun.day_id = params.fetch("day_id")
    @planned_fun.order_in_day = params.fetch("order_in_day")

    if @planned_fun.valid?
      @planned_fun.save

      redirect_to("/planned_funs/#{@planned_fun.id}", :notice => "Planned fun updated successfully.")
    else
      render("planned_fun_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @planned_fun = PlannedFun.find(params.fetch("id_to_remove"))

    @planned_fun.destroy

    redirect_to("/itineraries/" + @planned_fun.itinerary_id.to_s, :notice => "Planned activity deleted successfully.")
  end
end
