class GuestsController < ApplicationController
  before_action :set_guest, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_creator!, only: [:edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = current_user.guests.all
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = current_user.guests.new(guest_params)
    #@guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to guests_path, notice: 'Asesorado creado.' }
        format.json { render :index, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to guests_path, notice: 'Asesorado editado.' }
        format.json { render :index, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_path, notice: 'Asesorado eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_creator!
      redirect_to guests_path, alert: 'No estas autorizado.' unless (@guest.user_id == current_user.id) || current_user.admin
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:email, :name, :phone, :gender, :height, :dob, :next, :user_id)
    end
end
