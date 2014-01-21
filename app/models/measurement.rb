class Measurement < ActiveRecord::Base
  belongs_to :room, dependent: :destroy

end