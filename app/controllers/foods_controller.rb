class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    if params[:group]
      default_foods = Food.where(group: params[:group], default: true)
      user_foods = Food.where(group: params[:group], user_id: current_user.id) if current_user
      user_foods ? @foods = default_foods + user_foods : @foods = default_foods
      render "index_category"
    else
      render "index"
    end
  end

  # GET /foods/new
  def new
    @food = Food.new
    @groups = Food.pluck(:group).uniq
  end
  
  # POST /foods
  # POST /foods.json
  def create
    @food = current_user.foods.new(food_params)
    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Alimento creado.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Alimento eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :status, :group, :carbohydrates, :proteins, :fats, :default, :user_id)
    end
end
