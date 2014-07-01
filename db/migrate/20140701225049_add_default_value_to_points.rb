class AddDefaultValueToPoints < ActiveRecord::Migration
  def up
    change_column :tracks, :points, :integer, default: 0
  end

  def down
    change_column :tracks, :points, :integer, default: nil
  end
end
