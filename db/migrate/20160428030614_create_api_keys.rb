class CreateApiKeys < ActiveRecord::Migration[5.0]

  def change
    create_table :api_keys do |t|
      t.string :api_key
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
