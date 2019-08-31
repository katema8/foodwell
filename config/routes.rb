Rails.application.routes.draw do
  # Routes for the Wellness log resource:

  # CREATE
  get("/wellness_logs/new", { :controller => "wellness_logs", :action => "new_form" })
  post("/create_wellness_log", { :controller => "wellness_logs", :action => "create_row" })

  # READ
  get("/wellness_logs", { :controller => "wellness_logs", :action => "index" })
  get("/wellness_logs/:id_to_display", { :controller => "wellness_logs", :action => "show" })

  # UPDATE
  get("/wellness_logs/:prefill_with_id/edit", { :controller => "wellness_logs", :action => "edit_form" })
  post("/update_wellness_log/:id_to_modify", { :controller => "wellness_logs", :action => "update_row" })

  # DELETE
  get("/delete_wellness_log/:id_to_remove", { :controller => "wellness_logs", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Food log resource:

  # CREATE
  get("/food_logs/new", { :controller => "food_logs", :action => "new_form" })
  post("/create_food_log", { :controller => "food_logs", :action => "create_row" })

  # READ
  get("/food_logs", { :controller => "food_logs", :action => "index" })
  get("/food_logs/:id_to_display", { :controller => "food_logs", :action => "show" })

  # UPDATE
  get("/food_logs/:prefill_with_id/edit", { :controller => "food_logs", :action => "edit_form" })
  post("/update_food_log/:id_to_modify", { :controller => "food_logs", :action => "update_row" })

  # DELETE
  get("/delete_food_log/:id_to_remove", { :controller => "food_logs", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
