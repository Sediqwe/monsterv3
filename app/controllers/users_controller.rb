class UsersController < ApplicationController
  before_action :set_users, only: %i[ show edit update destroy ]
  before_action :authorized?, only: %i[show, index, edit destroy update]
  before_action lambda {
  resize_before_save(users_params[:photo])
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
        record_activity("Új felhasználó csatlakozott: #{@user.name}")
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
        flash[:notice] = "A felhasználói adatok módosítva"
        redirect_to settings_path(id: @user)
      else
        redirect_to settings_path(id: @user), notice: "A felhasználói adatok módosítása sikertelen"
      end
    
  end
  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(users_params)
        flash[:notice] = "A felhasználói adatok módosítva"
        record_activity("Egy felhasználó módosította az adatlapját: #{@user.name}")
        Translater.where(user_id: current_user.id).update(user_id: 0)
        upd = Translater.find(users_params[:translater_id])
        upd.update(user_id: @user.id)
        upd.save        
        format.html { redirect_to settings_path(id: @user), notice: "A felhasználói adatok módosítva" }        
      else
        flash[:error] = @user.errors.full_messages.join(", ") # Az összes hibaüzenet összefűzése
        format.html { render :settings, status: :unprocessable_entity}
        
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    record_activity("Egy felhasználó törölte magát: #{@user.name}")
    @users.destroy

    respond_to do |format|
      format.html { redirect_to users_index_url, notice: "users was successfully destroyed." }
      
    end
  end
  def resize_before_save(image_param)
    return unless image_param
  
    begin
      image = ImageProcessing::MiniMagick
                .source(image_param)
                .resize_to_fill(200,200)
                .call
  
      # Most, hogy a képet kicsinyítettük a kívánt méretre,
      # vágjuk ki a 200x200-as négyzetet a képből.
  
      ImageProcessing::MiniMagick
        .source(image)
        .crop("200x200+0+0")
        .call(destination: image_param.tempfile.path)
    rescue StandardError => _e
      # Do nothing. Ha valami hiba történik, akkor az model
      # validációkkal kezelhető majd később.
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
