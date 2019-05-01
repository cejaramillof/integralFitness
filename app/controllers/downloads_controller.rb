class DownloadsController < ApplicationController
  layout "print"
  before_action :set_plan, only: [:show]
  def show
    @creator = (@plan.user_id == current_user&.id) || current_user&.admin
    plans = @plan.guest.plans
    @weights = plans.pluck(:weight)
    @lean_mass = plans.pluck(:lean_mass)
    @fat_mass = plans.pluck(:fat_mass)
    #arr.map(&:email)
    @date = plans.pluck(:created_at).map{ |date| date.strftime("%d %b %Y") }

    @exercises = Exercise.all
    @exercise_day = ExerciseDay.new
    default_foods = Food.where(default: true)
    user_foods = Food.where(user_id: current_user.id) if current_user
    user_foods ? @foods = default_foods + user_foods : @foods = default_foods
    @food_day = FoodDay.new
    @exercises_linked = @plan.exercise_day
    @foods_linked = @plan.food_day
    if params[:print]
        render partial: "print", layout: "print"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end
end