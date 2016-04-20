class AddImageToPlants < ActiveRecord::Migration
  def self.up
    add_attachment :plants, :image
  end

  def self.down
    remove_attachment :plants, :image
  end
end
