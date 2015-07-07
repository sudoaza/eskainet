class CreateServerTargets < ActiveRecord::Migration
  def change
    create_table :servers_targets do |t|
      t.references :server, index: true, foreign_key: true
      t.references :target, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
