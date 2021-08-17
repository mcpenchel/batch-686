require 'byebug'
require_relative 'patient'
require_relative 'room'

ozzy   = Patient.new(name: 'Ozzy Osbourne')
janis  = Patient.new(name: 'Janis Joplin')
kurt   = Patient.new(name: 'Kurt Cobain')
taylor = Patient.new(name: 'Taylor Swift')

rock_room = Room.new(name: 'Rock Room', capacity: 3)

puts "#{rock_room.name} #{rock_room.full? ? 'is' : 'isn\'t'} full"

rock_room.add_patient(ozzy)
rock_room.add_patient(janis)
rock_room.add_patient(kurt)

puts "#{kurt.name} is inside the #{kurt.room.name}"

puts "#{rock_room.name} #{rock_room.full? ? 'is' : 'isn\'t'} full"

rock_room.add_patient(taylor) # will raise a StandardError exception
