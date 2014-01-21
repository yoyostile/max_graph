class AddAttributesToCube < ActiveRecord::Migration
  def change
    create_table :cubes do |t|
      t.string :serial, unique: true
      t.string :firmware
      t.timestamps
    end
  end
end
