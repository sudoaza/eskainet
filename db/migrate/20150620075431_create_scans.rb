class CreateScans < ActiveRecord::Migration
  def change
    create_table :scans do |t|
      t.references :scan_type, null: false
      t.references :target, null: false
      t.references :service
      t.datetime :date, null: false
      t.text :output

      t.timestamps null: false
    end
  end
end
