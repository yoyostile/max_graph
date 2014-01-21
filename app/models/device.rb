class Device < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :cube
  # has_one :room, primary_key: :uid

  def room
    Room.where(cube_id: cube_id, uid: room_id).first
  end

  def as_json(*args)
    super(only: 
        [:serial, :name, :type, :radio_state, 
        :battery_low, :transmit_error, :temperature, :valve_pos], methods: :room)
  end
end