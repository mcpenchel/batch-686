require_relative 'repositories/room_repository'
require_relative 'repositories/patient_repository'

room_repo = RoomRepository.new('rooms.csv')
patients_repo = PatientRepository.new('patients.csv', room_repo)

patients_repo.all.each do |patient|
  str = patient.cured? ? 'is' : 'isn\'t'
  puts "#{patient.id} - #{patient.name}, who #{str} cured, is inside the #{patient.room.name}"
end
