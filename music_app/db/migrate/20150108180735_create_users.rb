class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email, null: false, index: true, unique: true
      t.text :password_digest, null: false
      t.text :session_token, null: false, index: true, unique: true
      t.timestamps null: false
    end
  end
end
