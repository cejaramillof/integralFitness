class FoodDaysController < ApplicationController
  before_action :set_food_day, only: [:destroy]
  before_action :authenticate_user!, only: [:create, :destroy]
 
  # POST /food_days
  # POST /food_days.json
  def create
    @food_day = FoodDay.new(food_day_params)

    respond_to do |format|
      if @food_day.save
        format.html { redirect_to plan_path(@food_day.plan, anchor: 'food_view'), notice: 'Alimento Añadido.' }
        format.json { render :show, status: :created, location: @food_day }
      else
        format.html { render :new }
        format.json { render json: @food_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_days/1
  # DELETE /food_days/1.json
  def destroy
    plan = @food_day.plan
    @food_day.destroy
    respond_to do |format|
      format.html { redirect_to plan_path(plan, anchor: 'food_view'), notice: 'Alimento Eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_day
      @food_day = FoodDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_day_params
      params.require(:food_day).permit(:weight, :food_id, :plan_id, :description, :day, :moment)
    end
end
