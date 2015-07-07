class CreateServiceVersions < ActiveRecord::Migration
  def change
    create_table :service_versions do |t|
      t.string :version, null: false

      t.timestamps null: false
    end
  end
end
