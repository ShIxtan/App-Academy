class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false, index: true
      t.string :name, null: false
      t.string :bonus, null:false, limit: 1
      t.text :lyrics

      t.timestamps null: false
    end

    add_column :albums, :name, :string, null: false
  end
end
