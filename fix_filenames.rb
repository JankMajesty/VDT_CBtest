#!/usr/bin/env ruby
require 'csv'

input_file = '_data/VDT_metadata.csv'
output_file = '_data/VDT_metadata.csv.tmp'

# Read and process the CSV
first_row = true
CSV.open(output_file, 'w', encoding: 'UTF-8') do |csv_out|
  CSV.foreach(input_file, headers: true, encoding: 'UTF-8') do |row|
    # Write header
    if first_row
      csv_out << row.headers
      first_row = false
    end

    # Fix filename for child objects
    if row['filename'] && !row['filename'].empty?
      # Convert camh-dob-030012-p01.jpg to camh-dob-030012_0001_pub.jpg
      if row['filename'] =~ /^(camh-dob-\d+)-p(\d+)\.jpg$/
        parent_id = $1
        page_num = $2.to_i
        row['filename'] = "#{parent_id}_#{page_num.to_s.rjust(4, '0')}_pub.jpg"
      end
    end

    csv_out << row
  end
end

# Replace original file
File.rename(output_file, input_file)
puts "Fixed filenames in #{input_file}"
