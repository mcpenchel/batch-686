require 'csv'
require_relative '../models/patient'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []

    load_csv
  end

  def add(patient)
    # patient has name, has cured, has all the info.. but not the id
    patient.id = @patients.empty? ? 1 : @patients.last.id + 1

    @patients << patient

    save_csv
  end

  def all
    @patients
  end

  private
  def load_csv
    csv_options = {
      col_sep: ',',
      quote_char: '"',
      headers: :first_row,
      header_converters: :symbol
    }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      row[:room]  = @room_repository.find(row[:room_id].to_i)

      @patients << Patient.new(row)
    end
  end

  # this is incomplete!!
  def save_csv
    # .. skipping to the CSV part...
    CSV.open() do |csv|
      csv << ['id', 'name', 'cured', 'room_id']

      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?, patient.room.id]
      end
    end
    # ... end
  end
end
