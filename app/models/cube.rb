class Cube < ActiveRecord::Base
  has_many :rooms, dependent: :destroy
  has_many :devices, dependent: :destroy
  
end