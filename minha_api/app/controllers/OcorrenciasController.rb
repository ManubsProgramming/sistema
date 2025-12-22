class logsController < ApplicationController
  def index
    @logs = Log.all
    render json: @logs
  end

  def show
    @log = Log.find(params[:id])
    render json: @log
  end

  def create
    @log = Log.new(log_params)
    if @log.save
      render json: @log, status: :created
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  private

  def log_params
    params.require(:log).permit(:message, :level, :timestamp)
  end
end