class GmessagesController < ApplicationController
  before_action :set_gmessage, only: %i[ show edit update destroy ]

  # GET /gmessages or /gmessages.json
  def index
    @gmessages = Gmessage.all
  end

  # GET /gmessages/1 or /gmessages/1.json
  def show
  end

  # GET /gmessages/new
  def new
    @gmessage = Gmessage.new
  end

  # GET /gmessages/1/edit
  def edit
  end

  # POST /gmessages or /gmessages.json
  def create
    @gmessage = Gmessage.new(gmessage_params)

    respond_to do |format|
      if @gmessage.save
        format.html { redirect_to gmessage_url(@gmessage), notice: "Gmessage was successfully created." }
        format.json { render :show, status: :created, location: @gmessage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gmessages/1 or /gmessages/1.json
  def update
    respond_to do |format|
      if @gmessage.update(gmessage_params)
        format.html { redirect_to gmessage_url(@gmessage), notice: "Gmessage was successfully updated." }
        format.json { render :show, status: :ok, location: @gmessage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gmessages/1 or /gmessages/1.json
  def destroy
    @gmessage.destroy

    respond_to do |format|
      format.html { redirect_to gmessages_url, notice: "Gmessage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gmessage
      @gmessage = Gmessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gmessage_params
      params.require(:gmessage).permit(:user_id, :desc, :title, :game_id, :gmessage_id, :warn, :senduser_id)
    end
end
