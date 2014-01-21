class DevicesController < ApplicationController

  def show
    @device = Device.find_by_serial params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @device }
      format.js { render inline: @device.temperature.to_s }
    end
  end

end