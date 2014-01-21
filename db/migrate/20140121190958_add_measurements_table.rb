class AddMeasurementsTable < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.references :room
      t.decimal :measured_temp
      t.decimal :setpoint_temp
      t.string :mode
      t.string :temp_mode
      t.timestamps
    end
  end
end
