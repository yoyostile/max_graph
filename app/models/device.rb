class Device < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :cube
  # belongs_to :room, primary_key: :uid
end