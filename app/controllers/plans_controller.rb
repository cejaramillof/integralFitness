class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_creator!, only: [:show, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    @plans = if params[:email]
      current_user.plans.where(guest: Guest.where('lower(email) LIKE ?', "%#{params[:email].downcase}%")).paginate(:page => params[:page], :per_page => 4).order('id DESC')
    else
      current_user.plans.all.paginate(:page => params[:page], :per_page => 4).order('id DESC')
    end    
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
    @guests = current_user.guests.all
    @default = params[:user_id]
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = current_user.plans.new(plan_params)
    @plan.guest.update(next: params[:plan][:next])
    @guests = current_user.guests.all
    respond_to do |format|
      if @plan.save && @plan.guest.save
        format.html { redirect_to @plan, notice: 'Plan creado.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_creator!
      redirect_to plans_path, alert: 'No estas autorizado.' unless (@plan.user_id == current_user.id) || current_user.admin
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:user_id, :guest_id, :weight, :fat, :activity, :goal, :muscle_mass, :fat_mass, :skeletal_mass, :residual_mass, :lean_mass, :kcal, :proteins, :carbs, :fats, :description)
    end
end
