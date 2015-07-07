class CreateScanTypes < ActiveRecord::Migration
  def change
    create_table :scan_types do |t|
      t.string :name, null: false
      t.string :command, null: false
      t.references :service_type
      t.references :service_version

      t.timestamps null: false
    end
  end
end
