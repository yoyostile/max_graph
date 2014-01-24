class Room < ActiveRecord::Base
  belongs_to :cube 
  has_many :measurements, dependent: :destroy
  has_many :devices, primary_key: :uid

  def measure values
    measurements.create values.reject { |k,_| ['name','id','measured_humidity'].include? k }
  end

  def measured_temp
    measurements.last.measured_temp.to_f
  end

  def setpoint_temp
    measurements.last.setpoint_temp.to_f
  end

  def temp_mode
    measurements.last.temp_mode
  end

  def mode
    measurements.last.mode
  end

  def as_json(*args)
    super(only: [:name], methods: [:measured_temp, :setpoint_temp, :temp_mode, :mode])
  end

end