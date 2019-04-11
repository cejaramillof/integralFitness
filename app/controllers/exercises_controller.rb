class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show]

  # GET /exercises
  # GET /exercises.json
  def index
    if params[:muscle]
      @exercises = Exercise.where(gruppo1: params[:muscle])
      render "index_category"
    else
      @groups = Exercise.gruppo1s

      render "index"
      #@exercises = Exercise.all
    end
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end
end
