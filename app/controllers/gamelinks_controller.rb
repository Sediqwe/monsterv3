class GamelinksController < ApplicationController
  before_action :set_gamelink, only: %i[ show edit update destroy ]

  # GET /gamelinks or /gamelinks.json
  def index
    @gamelinks = Gamelink.all
  end

  # GET /gamelinks/1 or /gamelinks/1.json
  def show
  end

  # GET /gamelinks/new
  def new
    @gamelink = Gamelink.new
  end

  # GET /gamelinks/1/edit
  def edit
  end

  # POST /gamelinks or /gamelinks.json
  def create
    @gamelink = Gamelink.new(gamelink_params)

    respond_to do |format|
      if @gamelink.save
        format.html { redirect_to gamelink_url(@gamelink), notice: "Gamelink was successfully created." }
        format.json { render :show, status: :created, location: @gamelink }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gamelink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gamelinks/1 or /gamelinks/1.json
  def update
    respond_to do |format|
      if @gamelink.update(gamelink_params)
        format.html { redirect_to gamelink_url(@gamelink), notice: "Gamelink was successfully updated." }
        format.json { render :show, status: :ok, location: @gamelink }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gamelink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gamelinks/1 or /gamelinks/1.json
  def destroy
    @gamelink.destroy!

    respond_to do |format|
      format.html { redirect_to gamelinks_url, notice: "Gamelink was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamelink
      @gamelink = Gamelink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gamelink_params
      params.require(:gamelink).permit(:game_id, :link, :linktype_id)
    end
end
