class LinktypesController < ApplicationController
  before_action :set_linktype, only: %i[ show edit update destroy ]

  # GET /linktypes or /linktypes.json
  def index
    @linktypes = Linktype.all
  end

  # GET /linktypes/1 or /linktypes/1.json
  def show
  end

  # GET /linktypes/new
  def new
    @linktype = Linktype.new
  end

  # GET /linktypes/1/edit
  def edit
  end

  # POST /linktypes or /linktypes.json
  def create
    @linktype = Linktype.new(linktype_params)

    respond_to do |format|
      if @linktype.save
        format.html { redirect_to linktype_url(@linktype), notice: "Linktype was successfully created." }
        format.json { render :show, status: :created, location: @linktype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @linktype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linktypes/1 or /linktypes/1.json
  def update
    respond_to do |format|
      if @linktype.update(linktype_params)
        format.html { redirect_to linktype_url(@linktype), notice: "Linktype was successfully updated." }
        format.json { render :show, status: :ok, location: @linktype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @linktype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linktypes/1 or /linktypes/1.json
  def destroy
    @linktype.destroy!

    respond_to do |format|
      format.html { redirect_to linktypes_url, notice: "Linktype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linktype
      @linktype = Linktype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def linktype_params
      params.require(:linktype).permit(:name, :icon)
    end
end
