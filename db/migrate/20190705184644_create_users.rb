class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid 
      t.string :name
      t.string :location
      t.string :image_url
      t.string :url
      
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
  end
end
