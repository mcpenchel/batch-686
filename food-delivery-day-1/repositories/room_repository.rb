require 'csv'
require_relative '../models/room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []

    load_csv
  end

  def all
    @rooms
  end

  # this one I created
  def find(id)
    # this .find is from the ruby documentation on the Array class
    @rooms.find { |room| room.id == id }
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
      row[:id]       = row[:id].to_i
      row[:capacity] = row[:capacity].to_i

      @rooms << Room.new(row)
    end
  end
end
