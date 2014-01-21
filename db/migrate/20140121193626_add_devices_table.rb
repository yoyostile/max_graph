class AddDevicesTable < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :cube
      t.string :serial, unique: :true
      t.string :name
      t.integer :room_id
      t.string :firmware
      t.string :type
      t.string :radio_state
      t.string :battery_low
      t.string :transmit_error
      t.decimal :temperature
      t.string :valve_pos
      t.timestamps
    end
  end
end
