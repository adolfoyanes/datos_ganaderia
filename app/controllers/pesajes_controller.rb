class PesajesController < ApplicationController
  before_action :set_pesaje, only: [:show, :edit, :update, :destroy]

  # GET /pesajes
  # GET /pesajes.json
  def index
    @pesajes = Pesaje.all
    @los_animales  = Pesaje.select("id_2").group("id_2") 
    @promedio_glob = Pesaje.promedio_total(@los_animales)
  end

  # GET /pesajes/1
  # GET /pesajes/1.json
  def show
  end

  # GET /pesajes/new
  def new
    @pesaje = Pesaje.new
  end

  # GET /pesajes/1/edit
  def edit
  end

  def import
      Pesaje.import(params[:file])
      redirect_to pesajes_path, notice: "pesajes agregados"
  end

  # POST /pesajes
  # POST /pesajes.json
  def create
    @pesaje = Pesaje.new(pesaje_params)

    respond_to do |format|
      if @pesaje.save
        format.html { redirect_to @pesaje, notice: 'Pesaje was successfully created.' }
        format.json { render :show, status: :created, location: @pesaje }
      else
        format.html { render :new }
        format.json { render json: @pesaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pesajes/1
  # PATCH/PUT /pesajes/1.json
  def update
    respond_to do |format|
      if @pesaje.update(pesaje_params)
        format.html { redirect_to @pesaje, notice: 'Pesaje was successfully updated.' }
        format.json { render :show, status: :ok, location: @pesaje }
      else
        format.html { render :edit }
        format.json { render json: @pesaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pesajes/1
  # DELETE /pesajes/1.json
  def destroy
    @pesaje.destroy
    respond_to do |format|
      format.html { redirect_to pesajes_url, notice: 'Pesaje was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pesaje
      @pesaje = Pesaje.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pesaje_params
      params.require(:pesaje).permit(:id_2, :parto, :pesaje, :del, :lvd, :raza)
    end
end
