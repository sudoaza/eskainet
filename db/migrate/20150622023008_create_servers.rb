class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :os
      t.string :version

      t.timestamps null: false
    end
  end
end
