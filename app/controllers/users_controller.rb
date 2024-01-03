class UsersController < ApplicationController
  before_action :set_users, only: %i[ show edit update destroy ]
  before_action :authorized?, only: %i[show, index, edit destroy update]
  before_action lambda {
  resize_before_save(users_params[:photo], 200, 200)
}, only: [:update]
  # GET /users or /users.json
  def index
    
  end
  def settings
    @user = User.find(current_user.id)
  end
  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @users = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @users = users.new(users_params)
    @users.user_id = current_user.id
    @users.active = true
    respond_to do |format|
      if @users.save
        format.html { redirect_to users_url(@users), notice: "A felhasználó létrehozva." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        
      end
    end
  end
  def picturesdeletesettings
    
      @user = User.find(params[:id]) # Vagy ahogyan a feltöltésed azonosítottad
      picture = @user.photo

      if picture.present?
        picture.purge # A kép törlése az aktuális feltöltéshez kapcsolódóan
        redirect_to settings_path(id: @user), notice: "A felhasználói adatok módosítva"
      else
        redirect_to settings_path(id: @user), notice: "A felhasználói adatok módosítva"
      end
    
  end
  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(users_params)
        Translater.where(user_id: current_user.id).update(user_id: 0)
        upd = Translater.find(users_params[:translater_id])
        upd.update(user_id: @user.id)
        upd.save        
        format.html { redirect_to settings_path(id: @user), notice: "A felhasználói adatok módosítva" }        
      else
        format.html { render :settings, notice: "A felhasználói adatok módosítva"}
        
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @users.destroy

    respond_to do |format|
      format.html { redirect_to users_index_url, notice: "users was successfully destroyed." }
      
    end
  end
  def resize_before_save(image_param, width, height)
    return unless image_param

    begin
      ImageProcessing::MiniMagick
        .source(image_param)
        .crop("#{width}x#{height}+0+0")
        .call(destination: image_param.tempfile.path)
    rescue StandardError => _e
      # Do nothing. If this is catching, it probably means the
      # file type is incorrect, which can be caught later by
      # model validations.
    end
  end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_users
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_params
      params.require(:user).permit(:name, :email, :password, :alias, :moderator, :photo, :desc, :translater_id)
    end
end
