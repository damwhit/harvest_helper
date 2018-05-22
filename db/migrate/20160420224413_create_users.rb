class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :email
      t.string :oauth_token
      t.string :image

      t.timestamps null: false
    end
  end
end
