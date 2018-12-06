class PlannedMealsController < ApplicationController
  def index
    @planned_meals = PlannedMeal.all

    render("planned_meal_templates/index.html.erb")
  end

  def show
    @planned_meal = PlannedMeal.find(params.fetch("id_to_display"))

    render("planned_meal_templates/show.html.erb")
  end

  def new_form
    @planned_meal = PlannedMeal.new

    render("planned_meal_templates/new_form.html.erb")
  end

  def create_row
    @planned_meal = PlannedMeal.new

    @planned_meal.rest_id = params.fetch("rest_id")
    @planned_meal.day_id = params.fetch("day_id")
    @planned_meal.order_in_day = params.fetch("order_in_day")

    if @planned_meal.valid?
      @planned_meal.save

      redirect_back(:fallback_location => "/planned_meals", :notice => "Planned meal created successfully.")
    else
      render("planned_meal_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @planned_meal = PlannedMeal.find(params.fetch("prefill_with_id"))

    render("planned_meal_templates/edit_form.html.erb")
  end

  def update_row
    @planned_meal = PlannedMeal.find(params.fetch("id_to_modify"))

    @planned_meal.rest_id = params.fetch("rest_id")
    @planned_meal.day_id = params.fetch("day_id")
    @planned_meal.order_in_day = params.fetch("order_in_day")

    if @planned_meal.valid?
      @planned_meal.save

      redirect_to("/planned_meals/#{@planned_meal.id}", :notice => "Planned meal updated successfully.")
    else
      render("planned_meal_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @planned_meal = PlannedMeal.find(params.fetch("id_to_remove"))

    @planned_meal.destroy

    redirect_to("/planned_meals", :notice => "Planned meal deleted successfully.")
  end
end
