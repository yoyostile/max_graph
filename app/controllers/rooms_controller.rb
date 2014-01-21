class RoomsController < ApplicationController

  def show
    @room = Room.find params[:id]
    @devices = @room.devices
  end

end