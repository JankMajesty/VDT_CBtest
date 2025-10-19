#!/usr/bin/env ruby
# Script to add theme column to VDT_metadata.csv and populate theme values

require 'csv'

# Theme mappings
theme_mappings = {
  'Military Reconstruction Act' => [
    'camh-dob-030012',
    'camh-dob-030018',
    'camh-dob-030006',
    'camh-dob-030021',
    'camh-dob-030011'
  ],
  'African American Suffrage' => [
    'camh-dob-030029',
    'camh-dob-030020',
    'camh-dob-030033',
    'camh-dob-030038',
    'camh-dob-030015'
  ],
  'Southern Lost Cause Mentality' => [
    'camh-dob-030034',
    'camh-dob-030009',
    'camh-dob-030023',
    'camh-dob-030035',
    'camh-dob-030022'
  ]
}

# Build a lookup hash: objectid => theme
theme_lookup = {}
theme_mappings.each do |theme, objectids|
  objectids.each do |objectid|
    theme_lookup[objectid] = theme
  end
end

input_file = '_data/VDT_metadata.csv'
output_file = '_data/VDT_metadata.csv.new'

puts "Reading #{input_file}..."

# Read CSV
rows = CSV.read(input_file, headers: true, encoding: 'UTF-8')

# Add theme column to headers
headers = rows.headers + ['theme']

# Open output file
CSV.open(output_file, 'w', encoding: 'UTF-8') do |csv|
  # Write headers
  csv << headers

  rows_updated = 0

  # Process each row
  rows.each do |row|
    objectid = row['objectid']
    parentid = row['parentid']

    # Determine theme value
    theme_value = ''

    # Check if this is a parent object with a theme
    if theme_lookup[objectid]
      theme_value = theme_lookup[objectid]
      rows_updated += 1
    # Check if this is a child object whose parent has a theme
    elsif parentid && !parentid.empty? && theme_lookup[parentid]
      theme_value = theme_lookup[parentid]
      rows_updated += 1
    end

    # Add theme value to row
    row_data = row.fields + [theme_value]
    csv << row_data
  end

  puts "Processed #{rows.length} rows"
  puts "Updated #{rows_updated} rows with theme values"
end

# Backup original and replace with new file
backup_file = '_data/VDT_metadata.csv.backup'
File.rename(input_file, backup_file) if !File.exist?(backup_file)
File.rename(output_file, input_file)

puts "\nDone!"
puts "Original file backed up to: #{backup_file}"
puts "Theme column added to: #{input_file}"
