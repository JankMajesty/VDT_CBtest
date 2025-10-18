#!/usr/bin/env ruby
require 'csv'

input_file = '_data/VDT_metadata.csv'
output_file = '_data/VDT_metadata_fixed.csv'

puts "Fixing empty parentid values in #{input_file}..."

rows_fixed = 0
CSV.open(output_file, 'w', encoding: 'UTF-8') do |csv_out|
  CSV.foreach(input_file, headers: true, encoding: 'UTF-8') do |row|
    # Write header on first iteration
    csv_out << row.headers if csv_out.lineno == 0

    # Convert empty string parentid to nil
    if row['parentid'] && row['parentid'].strip.empty?
      row['parentid'] = nil
      rows_fixed += 1
    end

    csv_out << row
  end
end

puts "Fixed #{rows_fixed} empty parentid values"
puts "Replacing original file..."
File.rename(output_file, input_file)
puts "Done! Updated #{input_file}"
