#!/usr/bin/env ruby
require 'csv'

input_file = '_data/VDT_metadata.csv'
output_file = '_data/VDT_metadata_fixed.csv'

puts "Reading #{input_file}..."

# Read and process the CSV
rows_fixed = 0
CSV.open(output_file, 'w', encoding: 'UTF-8') do |csv_out|
  CSV.foreach(input_file, headers: true, encoding: 'UTF-8') do |row|
    # Write header on first iteration
    csv_out << row.headers if csv_out.lineno == 0

    # Fix filename for child objects
    if row['filename'] && !row['filename'].empty?
      # Convert camh-dob-030012-p01.jpg to camh-dob-030012_0001_pub.jpg
      if row['filename'] =~ /^(camh-dob-\d+)-p(\d+)\.jpg$/
        parent_id = $1
        page_num = $2.to_i
        old_filename = row['filename']
        row['filename'] = "#{parent_id}_#{page_num.to_s.rjust(4, '0')}_pub.jpg"
        puts "Fixed: #{old_filename} -> #{row['filename']}"
        rows_fixed += 1
      end
    end

    csv_out << row
  end
end

puts "\nFixed #{rows_fixed} filenames"
puts "Replacing original file..."
File.rename(output_file, input_file)
puts "Done! Updated #{input_file}"
