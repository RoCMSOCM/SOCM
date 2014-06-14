class CreateGalaxies < ActiveRecord::Migration
  def change
    create_table :galaxies do |t|

      t.timestamps
    end
  end
end
