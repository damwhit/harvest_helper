require 'csv'

photos = []

Dir.foreach(File.join Rails.root, "data/vegetable_photos/") {
  |file_name| photos << file_name
}

plant = File.join Rails.root, "data/garden_vegetables.csv"

count = 2
CSV.foreach(plant, headers: true, header_converters: :symbol) do |row|
  data = row.to_h
  record = Plant.create(data)

  record.update_attributes(image: File.open("#{Rails.root}/data/vegetable_photos/#{photos[count]}"))

  count += 1

  puts "Created #{record.class}-#{record.id}."
end
