class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :target, index: true, foreign_key: true
      t.string :protocol
      t.integer :port
      t.string :path
      t.references :service_type, index: true, foreign_key: true
      t.references :serice_version, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
