#!/usr/bin/env ruby
require 'csv'

# Add object_transcript field to VDT_metadata.csv with paths to OCR files

input_file = '_data/VDT_metadata.csv'
output_file = '_data/VDT_metadata.csv'

puts "Adding object_transcript field to #{input_file}..."

# Read the CSV
rows = CSV.read(input_file, headers: true, encoding: 'UTF-8')

# Add object_transcript column if it doesn't exist
unless rows.headers.include?('object_transcript')
  rows.headers << 'object_transcript'
  puts "✓ Added object_transcript column to headers"
end

# Find index of object_transcript column
transcript_col_index = rows.headers.index('object_transcript')

updated_count = 0
child_count = 0

# Process each row
rows.each do |row|
  # Only add transcripts for child objects (those with parentid and image format)
  if row['parentid'] && !row['parentid'].to_s.strip.empty? && row['format'] && row['format'].include?('image')
    objectid = row['objectid']

    # Construct the OCR file path
    # Expected format: /OCR/camh-dob-030009_0001_pub.txt
    ocr_filename = "#{objectid}_pub.txt"
    ocr_path = "/OCR/#{ocr_filename}"

    # Check if the file exists
    if File.exist?("OCR/#{ocr_filename}")
      row['object_transcript'] = ocr_path
      updated_count += 1
      puts "  #{objectid} → #{ocr_path}"
    else
      # Leave empty if file doesn't exist
      row['object_transcript'] = ''
      puts "  #{objectid} → (no OCR file found)"
    end

    child_count += 1
  else
    # Parent objects don't get transcripts
    row['object_transcript'] = '' unless row['object_transcript']
  end
end

# Write the updated CSV
CSV.open(output_file, 'w', encoding: 'UTF-8') do |csv|
  csv << rows.headers
  rows.each { |row| csv << row }
end

puts "\n✓ Updated #{updated_count} of #{child_count} child image records"
puts "✓ Metadata file updated successfully"
