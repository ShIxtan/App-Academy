class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.text :name, null:false, index: true, unique: true
      t.timestamps null: false
    end
  end
end
