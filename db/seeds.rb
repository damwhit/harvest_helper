require 'csv'

photos = []

Dir.entries(File.join Rails.root, "data/vegetable_photos/").sort.each {
  |file_name| photos << file_name
}

plants = File.join Rails.root, "data/garden_vegetables.csv"

count = 2
CSV.foreach(plants, headers: true, header_converters: :symbol) do |row|
  data = row.to_h
  record = Plant.create(data)


  record.upload_image_to_cloudinary("#{Rails.root}/data/vegetable_photos/#{photos[count]}");

  count += 1

  puts "Created #{record.class} #{record.id}."
end
