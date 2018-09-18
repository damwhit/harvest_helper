class Plant < ApplicationRecord
  before_create :reset_attributes

  belongs_to :user, optional: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :optimal_sun, presence: true
  validates :optimal_soil, presence: true
  validates :when_to_plant, presence: true
  validates :growing_from_seed, presence: true
  validates :transplanting, presence: true
  validates :spacing, presence: true

  def upload_image_to_cloudinary(image)
    env = Rails.env
    image_name = File.basename(image,File.extname(image))
    options = {
      :folder => "harvest_helper_#{Rails.env}",
      :public_id => image_name
    }
    response = Cloudinary::Uploader.upload(image, options)

    self.update!('image_url' => response['public_id'])
  end

  def reset_attributes
    self.planting_considerations = "n/a" if self.planting_considerations.nil?
    self.feeding = "n/a" if self.feeding.nil?
    self.other_care = "n/a" if self.other_care.nil?
    self.diseases = "n/a" if self.diseases.nil?
    self.harvesting = "n/a" if self.harvesting.nil?
    self.storage_use = "n/a" if self.storage_use.nil?
    self.watering = "n/a" if self.watering.nil?
  end
end
