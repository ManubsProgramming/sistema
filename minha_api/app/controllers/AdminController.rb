class ServiceProvidersController < ApplicationController
  before_action :set_service_provider, only: [:show, :update, :destroy]

  # GET /service_providers
  def index
    @service_providers = ServiceProvider.all
    render json: @service_providers
  end

  # GET /service_providers/:id
  def show
    render json: @service_provider
  end

  # POST /service_providers
  def create
    @service_provider = ServiceProvider.new(service_provider_params)
    if @service_provider.save
      render json: @service_provider, status: :created
    else
      render json: @service_provider.errors, status: :unprocessable_entity
    end
  end

  # PUT /service_providers/:id
  def update
    if @service_provider.update(service_provider_params)
      render json: @service_provider
    else
      render json: @service_provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /service_providers/:id
  def destroy
    @service_provider.destroy
    head :no_content
  end

  private

  def set_service_provider
    @service_provider = ServiceProvider.find(params[:id])
  end

  def service_provider_params
    params.require(:service_provider).permit(:name, :service_type, :contact_info)
  end
end