class BandsController < ApplicationController

  def index
    render json: Band.all
  end

  def create
    begin
      Band.transaction do
        @bands = Band.create!(bands_params)
      end
    rescue ActiveRecord::RecordInvalid => exception
      @bands = {
        error: {
          status: 422,
          message: exception
        }
      }
    end
  
    render json: @bands
  end
  
  private
  
  def bands_params
    params.permit(bands: [:name, :year]).require(:bands)
  end
end