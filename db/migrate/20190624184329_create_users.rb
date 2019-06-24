class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :profile_text
      t.string :picture_url
      t.boolean :online
      t.boolean :gm
      t.boolean :seeking
      t.float :latitude
      t.float :longitude 
      t.timestamps
    end
  end
end
