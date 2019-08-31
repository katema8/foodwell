Rails.application.routes.draw do
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
