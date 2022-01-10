class ComputersController < ApplicationController
  before_action :set_computer, only: %i[ show edit update destroy ]

  # GET /computers or /computers.json
  def index
    @computers = Computer.all
  end

  # GET /computers/1 or /computers/1.json
  def show
  end

  # GET /computers/new
  def new
    @computer = Computer.new
  end

  # GET /computers/1/edit
  def edit
  end

  # POST /computers or /computers.json
  def create
    @computer = Computer.new(computer_params)

    respond_to do |format|
      if @computer.save
        format.html { redirect_to @computer, notice: "Der Computer wurde erstellt." }
        format.json { render :show, status: :created, location: @computer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers/1 or /computers/1.json
  def update
    respond_to do |format|
      if @computer.update(computer_params)
        format.html { redirect_to @computer, notice: "Computer wurde aktualisiert." }
        format.json { render :show, status: :ok, location: @computer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1 or /computers/1.json
  def destroy
    @computer.destroy
    respond_to do |format|
      format.html { redirect_to computers_url, notice: "Computer was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  # url auf computer hinterlegen
  def url
    Net::SSH.start(Computer.find(params[:id]).fqdn, Computer.find(params[:id]).benutzer) do |ssh|
      output = ssh.exec!("echo '" + Computer.find(params[:id]).url + "' > urldatei.txt")
      
      puts output
      
    end
    
   respond_to do |format|
     format.html { redirect_to computers_url ,notice: 'Url übertragen' }
     format.json { render :show, status: :ok, location: @computer }
    end
  end

  # computer neu starten
  def neustart
    
    Net::SSH.start(Computer.find(params[:id]).fqdn, Computer.find(params[:id]).benutzer) do |ssh|
      output = ssh.exec!("shutdown -r now")
      
      puts output
     
     
    end
    
    respond_to do |format|
     format.html { redirect_to computers_url ,notice: 'Computer wird neugestartet' }
     format.json { render :show, status: :ok, location: @computer }
    end
  end

  # computer herunterfhren
  def herunterfahren
    
    Net::SSH.start(Computer.find(params[:id]).fqdn, Computer.find(params[:id]).benutzer) do |ssh|
      output = ssh.exec!("shutdown -h now")
      
      puts output
     
     
    end
    
    respond_to do |format|
     format.html { redirect_to computers_url ,notice: 'Computer wird neugestartet' }
     format.json { render :show, status: :ok, location: @computer }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def computer_params
      params.require(:computer).permit(:fqdn, :url, :gruppe_id, :standort, :benutzer)
    end
end
