class CreateTowerems < ActiveRecord::Migration[5.1]
  def change
    create_table :towerems do |t|

      t.timestamps
    end
  end
end
