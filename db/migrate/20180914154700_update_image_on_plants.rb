class UpdateImageOnPlants < ActiveRecord::Migration[5.2]
  def self.up
    remove_attachment :plants, :image
    add_column :plants, :image_url, :string
  end

  def self.down
    remove_column :plants, :image_url, :string
  end  
end
