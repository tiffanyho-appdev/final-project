Rails.application.routes.draw do
  # Routes for the index:
  get("/", { :controller => "odyssey", :action => "index" })

  #------------------------------
  # Routes for the Day resource:

  # CREATE
  get("/days/new", { :controller => "days", :action => "new_form" })
  post("/create_day", { :controller => "days", :action => "create_row" })

  # READ
  get("/days", { :controller => "days", :action => "index" })
  get("/days/:id_to_display", { :controller => "days", :action => "show" })

  # UPDATE
  get("/days/:prefill_with_id/edit", { :controller => "days", :action => "edit_form" })
  post("/update_day/:id_to_modify", { :controller => "days", :action => "update_row" })

  # DELETE
  get("/delete_day/:id_to_remove", { :controller => "days", :action => "destroy_row" })

  #------------------------------

  # Routes for the Planned fun resource:

  # CREATE
  get("/planned_funs/new", { :controller => "planned_funs", :action => "new_form" })
  post("/create_planned_fun", { :controller => "planned_funs", :action => "create_row" })

  # READ
  get("/planned_funs", { :controller => "planned_funs", :action => "index" })
  get("/planned_funs/:id_to_display", { :controller => "planned_funs", :action => "show" })

  # UPDATE
  get("/planned_funs/:prefill_with_id/edit", { :controller => "planned_funs", :action => "edit_form" })
  post("/update_planned_fun/:id_to_modify", { :controller => "planned_funs", :action => "update_row" })

  # DELETE
  get("/delete_planned_fun/:id_to_remove", { :controller => "planned_funs", :action => "destroy_row" })

  #------------------------------

  # Routes for the Planned meal resource:

  # CREATE
  get("/planned_meals/new", { :controller => "planned_meals", :action => "new_form" })
  post("/create_planned_meal", { :controller => "planned_meals", :action => "create_row" })

  # READ
  get("/planned_meals", { :controller => "planned_meals", :action => "index" })
  get("/planned_meals/:id_to_display", { :controller => "planned_meals", :action => "show" })

  # UPDATE
  get("/planned_meals/:prefill_with_id/edit", { :controller => "planned_meals", :action => "edit_form" })
  post("/update_planned_meal/:id_to_modify", { :controller => "planned_meals", :action => "update_row" })

  # DELETE
  get("/delete_planned_meal/:id_to_remove", { :controller => "planned_meals", :action => "destroy_row" })

  #------------------------------

  # Routes for the Planned stay resource:

  # CREATE
  get("/planned_stays/new", { :controller => "planned_stays", :action => "new_form" })
  post("/create_planned_stay", { :controller => "planned_stays", :action => "create_row" })

  # READ
  get("/planned_stays", { :controller => "planned_stays", :action => "index" })
  get("/planned_stays/:id_to_display", { :controller => "planned_stays", :action => "show" })

  # UPDATE
  get("/planned_stays/:prefill_with_id/edit", { :controller => "planned_stays", :action => "edit_form" })
  post("/update_planned_stay/:id_to_modify", { :controller => "planned_stays", :action => "update_row" })

  # DELETE
  get("/delete_planned_stay/:id_to_remove", { :controller => "planned_stays", :action => "destroy_row" })

  #------------------------------

  # Routes for the Itinerary resource:

  # CREATE
  get("/itineraries/new", { :controller => "itineraries", :action => "new_form" })
  post("/create_itinerary", { :controller => "itineraries", :action => "create_row" })

  # READ
  get("/itineraries", { :controller => "itineraries", :action => "index" })
  get("/itineraries/:id_to_display", { :controller => "itineraries", :action => "show" })

  # UPDATE
  get("/itineraries/:prefill_with_id/edit", { :controller => "itineraries", :action => "edit_form" })
  post("/update_itinerary/:id_to_modify", { :controller => "itineraries", :action => "update_row" })

  # DELETE
  get("/delete_itinerary/:id_to_remove", { :controller => "itineraries", :action => "destroy_row" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  get("/restaurants/new", { :controller => "restaurants", :action => "new_form" })
  post("/create_restaurant", { :controller => "restaurants", :action => "create_row" })

  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  get("/restaurants/:id_to_display", { :controller => "restaurants", :action => "show" })

  # UPDATE
  get("/restaurants/:prefill_with_id/edit", { :controller => "restaurants", :action => "edit_form" })
  post("/update_restaurant/:id_to_modify", { :controller => "restaurants", :action => "update_row" })

  # DELETE
  get("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "destroy_row" })

  #------------------------------

  # Routes for the Place resource:

  # CREATE
  # get("/places/new", { :controller => "places", :action => "new_form" })
  # post("/create_place", { :controller => "places", :action => "create_row" })

  # READ
  get("/places", { :controller => "places", :action => "index" })
  get("/places/:id_to_display", { :controller => "places", :action => "show" })

  # UPDATE
  get("/places/:prefill_with_id/edit", { :controller => "places", :action => "edit_form" })
  post("/update_place/:id_to_modify", { :controller => "places", :action => "update_row" })

  # DELETE
  get("/delete_place/:id_to_remove", { :controller => "places", :action => "destroy_row" })

  #------------------------------

  # Routes for the Hotel resource:

  # CREATE
  get("/hotels/new", { :controller => "hotels", :action => "new_form" })
  post("/create_hotel", { :controller => "hotels", :action => "create_row" })

  # READ
  get("/hotels", { :controller => "hotels", :action => "index" })
  get("/hotels/:id_to_display", { :controller => "hotels", :action => "show" })

  # UPDATE
  get("/hotels/:prefill_with_id/edit", { :controller => "hotels", :action => "edit_form" })
  post("/update_hotel/:id_to_modify", { :controller => "hotels", :action => "update_row" })

  # DELETE
  get("/delete_hotel/:id_to_remove", { :controller => "hotels", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
