class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :url
      t.integer :playlist_id
      t.integer :points

      t.timestamps
    end
  end
end
