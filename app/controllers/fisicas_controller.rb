class FisicasController < ApplicationController
  before_action :set_fisica, only: %i[ show edit update destroy ]

  # GET /fisicas or /fisicas.json
  def index
    @fisicas = Fisica.all
  end

  # GET /fisicas/1 or /fisicas/1.json
  def show
  end

  # GET /fisicas/new
  def new
    @fisica = Fisica.new
  end

  # GET /fisicas/1/edit
  def edit
  end

  # POST /fisicas or /fisicas.json
  def create
    @fisica = Fisica.new(fisica_params)

    respond_to do |format|
      if @fisica.save
        format.html { redirect_to fisica_url(@fisica), notice: "Fisica was successfully created." }
        format.json { render :show, status: :created, location: @fisica }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fisicas/1 or /fisicas/1.json
  def update
    respond_to do |format|
      if @fisica.update(fisica_params)
        format.html { redirect_to fisica_url(@fisica), notice: "Fisica was successfully updated." }
        format.json { render :show, status: :ok, location: @fisica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fisicas/1 or /fisicas/1.json
  def destroy
    @fisica.destroy!

    respond_to do |format|
      format.html { redirect_to fisicas_url, notice: "Fisica was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fisica
      @fisica = Fisica.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fisica_params
      params.require(:fisica).permit(:pessoa_id, :cpf)
    end
end
