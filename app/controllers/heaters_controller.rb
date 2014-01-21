class HeatersController < ApplicationController
  protect_from_forgery except: :create

  def create
    cube = Cube.find_or_create_by_serial(serial: params['Cube.Serial'], firmware: params['Cube.Firmware'])
    room_params.each do |k,v|
      room = cube.rooms.find_or_create_by_uid(uid: k, name: v['name'])
      room.measure v
    end
    device_params.each do |k,v|
      device = cube.devices.find_or_create_by_serial(v['serial'])
      device.update! v.reject{ |k,_| ['temperature_timestamp'].include? k }
    end
    head :ok
  end

  private

  def room_params
    room_hash = params.select{ |k,_| k.match(/^Room/) }
    room_hash.inject({}) do |hash, arr|
      match_data = arr[0].match(/^Room.(\d*).(\S*)/)
      if hash[match_data[1]]
        hash[match_data[1]].merge!({ match_data[2].underscore => arr[1] })
      else
        hash[match_data[1]] = { match_data[2].underscore => arr[1] }
      end
      hash
    end
  end

  def device_params
    device_hash = params.select{ |k,_| k.match(/^Device/) }
    device_hash.inject({}) do |hash, arr|
      match_data = arr[0].match(/^Device.([\w\d]*).(\S*)/)
      if hash[match_data[1]]
        hash[match_data[1]].merge!({ match_data[2].underscore => arr[1] })
      else
        hash[match_data[1]] = { match_data[2].underscore => arr[1] }
      end
      hash
    end
  end
end