class AddUserIdToPlants < ActiveRecord::Migration[5.2]
  def change
    add_reference :plants, :user, index: true, foreign_key: true
  end
end
