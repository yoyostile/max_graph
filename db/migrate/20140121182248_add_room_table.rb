class AddRoomTable < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :cube
      t.integer :uid
      t.string :name
      t.timestamps
    end
  end
end
