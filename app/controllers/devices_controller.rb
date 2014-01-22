class DevicesController < ApplicationController

  def show
    @device = Device.find_by_serial params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @device }
      format.js { render inline: @device.to_cacti }
    end
  end

end