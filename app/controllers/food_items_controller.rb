class FoodItemsController < ApplicationController
  def index
    @q = FoodItem.ransack(params[:q])
    @food_items = @q.result(:distinct => true).page(params[:page]).per(10)

    render("food_item_templates/index.html.erb")
  end

  def show
    @food_item = FoodItem.find(params.fetch("id_to_display"))

    render("food_item_templates/show.html.erb")
  end

  def new_form
    @food_item = FoodItem.new

    render("food_item_templates/new_form.html.erb")
  end

  def create_row
    @food_item = FoodItem.new

    @food_item.food_item = params.fetch("food_item")

    if @food_item.valid?
      @food_item.save

      redirect_back(:fallback_location => "/food_items", :notice => "Food item created successfully.")
    else
      render("food_item_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @food_item = FoodItem.find(params.fetch("prefill_with_id"))

    render("food_item_templates/edit_form.html.erb")
  end

  def update_row
    @food_item = FoodItem.find(params.fetch("id_to_modify"))

    @food_item.food_item = params.fetch("food_item")

    if @food_item.valid?
      @food_item.save

      redirect_to("/food_items/#{@food_item.id}", :notice => "Food item updated successfully.")
    else
      render("food_item_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @food_item = FoodItem.find(params.fetch("id_to_remove"))

    @food_item.destroy

    redirect_to("/food_items", :notice => "Food item deleted successfully.")
  end
end
