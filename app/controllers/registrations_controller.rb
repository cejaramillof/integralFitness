class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: [:update_post]
  before_action :authenticate_admin!, only: [:update_post, :index]
  def index
    @users = User.where(admin: !true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end
  
  def update_post
    @user = User.find params[:id]
    if params[:user][:months] != ""
      @months = params[:user][:months].to_i
      assign_date(params)
    end
    respond_to do |format|
      if @user.update_attributes(premium: params[:user][:premium])
        format.html { redirect_to users_admin_path, :notice => 'Usuario actualizado con éxito.' }
        format.json { head :ok }
      end
    end
  end
  
  protected

  def assign_date(params)
    case @months
    when 0
      params[:user][:premium] = ""
    else
      params[:user][:premium] = (@user.premium || Time.now) + @months.months
    end
  end
  
  def update_resource(resource, params)
    if params[:password]
      resource.password = params[:password]
      resource.password_confirmation = params[:password_confirmation]
    end
    resource.update_without_password(params)
  end
end