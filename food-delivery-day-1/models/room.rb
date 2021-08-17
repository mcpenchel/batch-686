require 'byebug'

class Room
  attr_reader :name, :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id       = attributes[:id]
    @name     = attributes[:name]
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end

  def full?
    @patients.size == @capacity
  end

  # instance method
  def add_patient(patient)
    raise StandardError, 'Room is full!' if full?
    patient.room = self # the room instance
    @patients << patient
  end
end
