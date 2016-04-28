class Plant < ActiveRecord::Base
  before_create :reset_attributes

  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :optimal_sun, presence: true
  validates :optimal_soil, presence: true
  validates :when_to_plant, presence: true
  validates :growing_from_seed, presence: true
  validates :transplanting, presence: true
  validates :spacing, presence: true
  validates :watering, presence: true

  # This method associates the attribute ":image" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
    default_url: "https://s3.amazonaws.com/harvest-helper/plants/images/000/000/001/medium/01_tomato.jpg"
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def reset_attributes
    self.planting_considerations = "n/a" if self.planting_considerations.nil?
    self.feeding = "n/a" if self.feeding.nil?
    self.other_care = "n/a" if self.other_care.nil?
    self.diseases = "n/a" if self.diseases.nil?
    self.harvesting = "n/a" if self.harvesting.nil?
    self.storage_use = "n/a" if self.storage_use.nil?
  end
end
