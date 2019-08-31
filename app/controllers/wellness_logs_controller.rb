class WellnessLogsController < ApplicationController
  def index
    @wellness_logs = WellnessLog.all

    render("wellness_log_templates/index.html.erb")
  end

  def show
    @wellness_log = WellnessLog.find(params.fetch("id_to_display"))

    render("wellness_log_templates/show.html.erb")
  end

  def new_form
    @wellness_log = WellnessLog.new

    render("wellness_log_templates/new_form.html.erb")
  end

  def create_row
    @wellness_log = WellnessLog.new

    @wellness_log.gut_wellness = params.fetch("gut_wellness")
    @wellness_log.date = params.fetch("date")
    @wellness_log.user_id = params.fetch("user_id")

    if @wellness_log.valid?
      @wellness_log.save

      redirect_back(:fallback_location => "/wellness_logs", :notice => "Wellness log created successfully.")
    else
      render("wellness_log_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @wellness_log = WellnessLog.find(params.fetch("prefill_with_id"))

    render("wellness_log_templates/edit_form.html.erb")
  end

  def update_row
    @wellness_log = WellnessLog.find(params.fetch("id_to_modify"))

    @wellness_log.gut_wellness = params.fetch("gut_wellness")
    @wellness_log.date = params.fetch("date")
    @wellness_log.user_id = params.fetch("user_id")

    if @wellness_log.valid?
      @wellness_log.save

      redirect_to("/wellness_logs/#{@wellness_log.id}", :notice => "Wellness log updated successfully.")
    else
      render("wellness_log_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @wellness_log = WellnessLog.find(params.fetch("id_to_remove"))

    @wellness_log.destroy

    redirect_to("/users/#{@wellness_log.user_id}", notice: "WellnessLog deleted successfully.")
  end

  def destroy_row
    @wellness_log = WellnessLog.find(params.fetch("id_to_remove"))

    @wellness_log.destroy

    redirect_to("/wellness_logs", :notice => "Wellness log deleted successfully.")
  end
end
