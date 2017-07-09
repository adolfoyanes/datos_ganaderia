class VacasController < ApplicationController
  before_action :set_vaca, only: [:show, :edit, :update, :destroy]

  # GET /vacas
  # GET /vacas.json
  def index
    @vacas = Vaca.all
  end

  # GET /vacas/1
  # GET /vacas/1.json
  def show
  end

  # GET /vacas/new
  def new
    @vaca = Vaca.new
  end

  # GET /vacas/1/edit
  def edit
  end

  def import
      Vaca.delete_all
      Vaca.import(params[:file])
      redirect_to vacas_path, notice: "vacas agregadas"
  end

  # POST /vacas
  # POST /vacas.json
  def create
    @vaca = Vaca.new(vaca_params)

    respond_to do |format|
      if @vaca.save
        format.html { redirect_to @vaca, notice: 'Vaca was successfully created.' }
        format.json { render :show, status: :created, location: @vaca }
      else
        format.html { render :new }
        format.json { render json: @vaca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacas/1
  # PATCH/PUT /vacas/1.json
  def update
    respond_to do |format|
      if @vaca.update(vaca_params)
        format.html { redirect_to @vaca, notice: 'Vaca was successfully updated.' }
        format.json { render :show, status: :ok, location: @vaca }
      else
        format.html { render :edit }
        format.json { render json: @vaca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacas/1
  # DELETE /vacas/1.json
  def destroy
    @vaca.destroy
    respond_to do |format|
      format.html { redirect_to vacas_url, notice: 'Vaca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vaca
      @vaca = Vaca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vaca_params
      params.require(:vaca).permit(:id_2, :anonac, :padre, :nropar, :grupo_racial, :tipser, :toroas, :diagno, :fparto, :becerro, :sexo, :pesonacer, :pesodestete, :peso18)
    end
end
