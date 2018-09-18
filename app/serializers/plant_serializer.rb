class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :optimal_sun, :optimal_soil, :planting_considerations, :when_to_plant, :growing_from_seed, :transplanting, :spacing, :watering, :feeding, :other_care, :diseases, :pests, :harvesting, :storage_use, :image_url
end
