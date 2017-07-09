class ReproduccionsController < ApplicationController
  before_action :set_reproduccion, only: [:show, :edit, :update, :destroy]

  # GET /reproduccions
  # GET /reproduccions.json
  def index
    @reproduccions = Reproduccion.all
    @vacas = Reproduccion.select("id_2").group("id_2")
    dias = Reproduccion.ipp(@vacas)
  end

  # GET /reproduccions/1
  # GET /reproduccions/1.json
  def show
  end

  # GET /reproduccions/new
  def new
    @reproduccion = Reproduccion.new
  end

  # GET /reproduccions/1/edit
  def edit
  end

  def import
      Reproduccion.delete_all
      Reproduccion.import(params[:file])
      redirect_to reproduccions_path, notice: "pesajes agregados"
  end

  # POST /reproduccions
  # POST /reproduccions.json
  def create
    @reproduccion = Reproduccion.new(reproduccion_params)

    respond_to do |format|
      if @reproduccion.save
        format.html { redirect_to @reproduccion, notice: 'Reproduccion was successfully created.' }
        format.json { render :show, status: :created, location: @reproduccion }
      else
        format.html { render :new }
        format.json { render json: @reproduccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reproduccions/1
  # PATCH/PUT /reproduccions/1.json
  def update
    respond_to do |format|
      if @reproduccion.update(reproduccion_params)
        format.html { redirect_to @reproduccion, notice: 'Reproduccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @reproduccion }
      else
        format.html { render :edit }
        format.json { render json: @reproduccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reproduccions/1
  # DELETE /reproduccions/1.json
  def destroy
    @reproduccion.destroy
    respond_to do |format|
      format.html { redirect_to reproduccions_url, notice: 'Reproduccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reproduccion
      @reproduccion = Reproduccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reproduccion_params
      params.require(:reproduccion).permit(:id_2, :nacimiento, :anonac, :padre, :madre, :lact, :id_lact, :parto, :anopart, :mesparto, :cria, :sexo_cria, :padre_cria, :meses_parto, :prenez, :toro_prenez, :servicios, :secado, :lechetotal, :del, :acum_305d, :removida, :fecha_salida)
    end
end
