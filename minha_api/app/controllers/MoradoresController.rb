class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :update, :destroy]

  # GET /incidents
  def index
    @incidents = Incident.all
    render json: @incidents
  end

  # GET /incidents/:id
  def show
    render json: @incident
  end

  # POST /incidents
  def create
    @incident = Incident.new(incident_params)
    if @incident.save
      render json: @incident, status: :created
    else
      render json: @incident.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incidents/:id
  def update
    if @incident.update(incident_params)
      render json: @incident
    else
      render json: @incident.errors, status: :unprocessable_entity
    end
  end

  # DELETE /incidents/:id
  def destroy
    @incident.destroy
    head :no_content
  end

  private

  def set_incident
    @incident = Incident.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Incident not found' }, status: :not_found
  end

  def incident_params
    params.require(:incident).permit(:title, :description, :status, :reported_at)
  end
end