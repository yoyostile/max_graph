class Cube < ActiveRecord::Base
  has_many :rooms, dependent: :destroy
  has_many :devices, dependent: :destroy

  
  def to_param
    serial
  end  

  def as_json(*args)
    super(only: [:serial], include: [:devices])
  end
end