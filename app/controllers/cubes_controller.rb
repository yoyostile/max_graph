class CubesController < ApplicationController

  def index
    @cubes = Cube.all
  end

  def show
    @cube = Cube.find_by_serial params[:id]
    @rooms = @cube.rooms
    respond_to do |format|
      format.html { render }
      format.json { render json: @cube }
    end
  end

end