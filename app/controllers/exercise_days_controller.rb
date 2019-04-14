class ExerciseDaysController < ApplicationController
  before_action :set_exercise_day, only: [:destroy]

  # POST /exercise_days
  # POST /exercise_days.json
  def create
    @exercise_day = ExerciseDay.new(exercise_day_params)

    respond_to do |format|
      if @exercise_day.save
        format.html { redirect_to plan_path(@exercise_day.plan, anchor: 'exercise_view'), notice: 'Ejercicio Añadido.' }
        format.json { render :show, status: :created, location: @exercise_day }
      else
        format.html { render :new }
        format.json { render json: @exercise_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_days/1
  # DELETE /exercise_days/1.json
  def destroy
    plan = @exercise_day.plan
    @exercise_day.destroy
    respond_to do |format|
      format.html { redirect_to plan_path(plan, anchor: 'exercise_view'), notice: 'Ejercicio Eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_day
      @exercise_day = ExerciseDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_day_params
      params.require(:exercise_day).permit(:exercise_id, :plan_id, :day, :order, :description)
    end
end
