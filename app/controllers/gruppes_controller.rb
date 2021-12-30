class GruppesController < ApplicationController
  before_action :set_gruppe, only: %i[ show edit update destroy ]

  # GET /gruppes or /gruppes.json
  def index
    @gruppes = Gruppe.all
  end

  # GET /gruppes/1 or /gruppes/1.json
  def show
  end

  # GET /gruppes/new
  def new
    @gruppe = Gruppe.new
  end

  # GET /gruppes/1/edit
  def edit
  end

  # POST /gruppes or /gruppes.json
  def create
    @gruppe = Gruppe.new(gruppe_params)

    respond_to do |format|
      if @gruppe.save
        format.html { redirect_to @gruppe, notice: "Gruppe wurde erstellt." }
        format.json { render :show, status: :created, location: @gruppe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gruppe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gruppes/1 or /gruppes/1.json
  def update
    respond_to do |format|
      if @gruppe.update(gruppe_params)
        format.html { redirect_to @gruppe, notice: "Gruppe wurde akualisiert" }
        format.json { render :show, status: :ok, location: @gruppe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gruppe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gruppes/1 or /gruppes/1.json
  def destroy
    @gruppe.destroy
    respond_to do |format|
      format.html { redirect_to gruppes_url, notice: "Gruppe wurde gelöscht." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gruppe
      @gruppe = Gruppe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gruppe_params
      params.require(:gruppe).permit(:name)
    end
end
