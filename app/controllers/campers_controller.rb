class CampersController < ApplicationController
  before_action :set_camper, only: [:show, :update, :destroy]

  # GET /campers
  def index
    @campers = Camper.all

    render json: @campers
  end

  # GET /campers/1
  def show
    camper = Camper.find_by_id(params[:id])
    if camper 
      render json: camper, serializer: CamperActivitySerializerSerializer
    else  
      render json: {"error": "Camper not found"}
    end
  end

  # POST /campers
  def create
    @camper = Camper.new(camper_params)

    if @camper.save
      render json: @camper, status: :created, location: @camper
    else
      render json: { "errors": ["validation errors"] }
    end
  end

  # PATCH/PUT /campers/1
  def update
    if @camper.update(camper_params)
      render json: @camper
    else
      render json: @camper.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campers/1
  def destroy
    @camper.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper
      @camper = Camper.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def camper_params
      params.permit(:name, :age)
    end
end
