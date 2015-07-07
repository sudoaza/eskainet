class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :domain, null: false
      t.timestamps null: false
    end

    add_index :targets, :domain
  end
end
