class AddStateToScan < ActiveRecord::Migration
  def change
    add_column :scans, :state, :string, index: true, default: 'pending'
  end
end
