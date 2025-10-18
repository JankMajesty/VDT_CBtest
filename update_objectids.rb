#!/usr/bin/env ruby
require 'csv'

input_file = '_data/VDT_metadata.csv'
output_file = '_data/VDT_metadata_updated.csv'

puts "Updating objectids in #{input_file}..."

rows_updated = 0
CSV.open(output_file, 'w', encoding: 'UTF-8') do |csv_out|
  CSV.foreach(input_file, headers: true, encoding: 'UTF-8') do |row|
    # Write header on first iteration
    csv_out << row.headers if csv_out.lineno == 0

    # Update objectid for child objects: camh-dob-030012-p01 -> camh-dob-030012_0001
    if row['objectid'] =~ /^(camh-dob-\d+)-p(\d+)$/
      parent_id = $1
      page_num = $2.to_i
      old_objectid = row['objectid']
      row['objectid'] = "#{parent_id}_#{page_num.to_s.rjust(4, '0')}"
      puts "Updated objectid: #{old_objectid} -> #{row['objectid']}"
      rows_updated += 1
    end

    csv_out << row
  end
end

puts "\nUpdated #{rows_updated} objectids"
puts "Replacing original file..."
File.rename(output_file, input_file)
puts "Done! Updated #{input_file}"
