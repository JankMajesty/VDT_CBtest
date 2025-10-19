#!/usr/bin/env ruby
require 'csv'

# Update source field to "Natchez Trace Collection; Dolph Briscoe Center for American History"

input_file = '_data/VDT_metadata.csv'
output_file = '_data/VDT_metadata.csv'

new_source = "Natchez Trace Collection; Dolph Briscoe Center for American History"

puts "Updating source field in #{input_file}..."

rows = CSV.read(input_file, headers: true, encoding: 'UTF-8')

updated_count = 0

rows.each do |row|
  if row['source'] && row['source'] != new_source
    row['source'] = new_source
    updated_count += 1
  end
end

CSV.open(output_file, 'w', encoding: 'UTF-8') do |csv|
  csv << rows.headers
  rows.each { |row| csv << row }
end

puts "✓ Updated #{updated_count} rows"
puts "✓ All rows now have source: '#{new_source}'"
