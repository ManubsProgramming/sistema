class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :update, :destroy]

  # GET /packages
  def index
    @packages = Package.all
    render json: @packages
  end

  # GET /packages/:id
  def show
    render json: @package
  end

  # POST /packages
  def create
    @package = Package.new(package_params)
    if @package.save
      render json: @package, status: :created
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # PUT /packages/:id
  def update
    if @package.update(package_params)
      render json: @package
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packages/:id
  def destroy
    @package.destroy
    head :no_content
  end

  private

  def set_package
    @package = Package.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Package not found' }, status: :not_found
  end

  def package_params
    params.require(:package).permit(:name, :version, :description)
  end
end