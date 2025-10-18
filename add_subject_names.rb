#!/usr/bin/env ruby
require 'csv'

master_file = '_data/2_TWIG2025-09-02_PalaciosVDT - metadata(1).csv'
vdt_file = '_data/VDT_metadata.csv'
output_file = '_data/VDT_metadata_updated.csv'

puts "Reading master metadata from #{master_file}..."

# Read master metadata into a hash keyed by objectid
master_data = {}
CSV.foreach(master_file, headers: true, encoding: 'UTF-8') do |row|
  objectid = row['dbcah_id']  # Master file uses dbcah_id instead of objectid
  next unless objectid

  # Collect subject names
  subject_names = []
  subject_names << row['subject_name_1'].to_s.strip if row['subject_name_1'] && !row['subject_name_1'].to_s.strip.empty?
  subject_names << row['subject_name_2'].to_s.strip if row['subject_name_2'] && !row['subject_name_2'].to_s.strip.empty?

  master_data[objectid] = subject_names
end

puts "Found subject names for #{master_data.size} items in master metadata"
puts "\nUpdating VDT metadata..."

rows_updated = 0
CSV.open(output_file, 'w', encoding: 'UTF-8') do |csv_out|
  CSV.foreach(vdt_file, headers: true, encoding: 'UTF-8') do |row|
    # Write header on first iteration
    csv_out << row.headers if csv_out.lineno == 0

    objectid = row['objectid']

    # Add subject names if they exist for this objectid
    if master_data[objectid] && !master_data[objectid].empty?
      existing_subjects = row['subject'].to_s.split(';').map(&:strip).reject(&:empty?)
      new_subjects = master_data[objectid]

      # Combine existing and new subjects, remove duplicates
      all_subjects = (existing_subjects + new_subjects).uniq

      old_subject = row['subject']
      row['subject'] = all_subjects.join('; ')

      if old_subject != row['subject']
        puts "Updated #{objectid}: added #{new_subjects.join(', ')}"
        rows_updated += 1
      end
    end

    csv_out << row
  end
end

puts "\nUpdated #{rows_updated} rows with subject names"
puts "Replacing original file..."
File.rename(output_file, vdt_file)
puts "Done! Updated #{vdt_file}"
