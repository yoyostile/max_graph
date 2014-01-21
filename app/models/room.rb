class Room < ActiveRecord::Base
  belongs_to :cube 
  has_many :measurements, dependent: :destroy
  has_many :devices, through: :cube

  def measure values
    measurements.create values.reject { |k,_| ['name','id','measured_humidity'].include? k }
  end

end