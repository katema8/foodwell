class FoodLogsController < ApplicationController
  def index
    @food_logs = FoodLog.page(params[:page]).per(10)

    render("food_log_templates/index.html.erb")
  end

  def show
    @food_log = FoodLog.find(params.fetch("id_to_display"))

    render("food_log_templates/show.html.erb")
  end

  def new_form
    @food_log = FoodLog.new

    render("food_log_templates/new_form.html.erb")
  end

  def create_row
    @food_log = FoodLog.new

    @food_log.food_item_id = params.fetch("food_item_id")
    @food_log.date = params.fetch("date")
    @food_log.wellness_log_id = params.fetch("wellness_log_id")
    @food_log.user_id = params.fetch("user_id")

    if @food_log.valid?
      @food_log.save

      redirect_back(:fallback_location => "/food_logs", :notice => "Food log created successfully.")
    else
      render("food_log_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_wellness_log
    @food_log = FoodLog.new

    @food_log.food_item_id = params.fetch("food_item_id")
    @food_log.date = params.fetch("date")
    @food_log.wellness_log_id = params.fetch("wellness_log_id")
    @food_log.user_id = params.fetch("user_id")

    if @food_log.valid?
      @food_log.save

      redirect_to("/wellness_logs/#{@food_log.wellness_log_id}", notice: "FoodLog created successfully.")
    else
      render("food_log_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @food_log = FoodLog.find(params.fetch("prefill_with_id"))

    render("food_log_templates/edit_form.html.erb")
  end

  def update_row
    @food_log = FoodLog.find(params.fetch("id_to_modify"))

    @food_log.food_item_id = params.fetch("food_item_id")
    @food_log.date = params.fetch("date")
    @food_log.wellness_log_id = params.fetch("wellness_log_id")
    @food_log.user_id = params.fetch("user_id")

    if @food_log.valid?
      @food_log.save

      redirect_to("/food_logs/#{@food_log.id}", :notice => "Food log updated successfully.")
    else
      render("food_log_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @food_log = FoodLog.find(params.fetch("id_to_remove"))

    @food_log.destroy

    redirect_to("/users/#{@food_log.user_id}", notice: "FoodLog deleted successfully.")
  end

  def destroy_row_from_wellness_log
    @food_log = FoodLog.find(params.fetch("id_to_remove"))

    @food_log.destroy

    redirect_to("/wellness_logs/#{@food_log.wellness_log_id}", notice: "FoodLog deleted successfully.")
  end

  def destroy_row
    @food_log = FoodLog.find(params.fetch("id_to_remove"))

    @food_log.destroy

    redirect_to("/food_logs", :notice => "Food log deleted successfully.")
  end
end
