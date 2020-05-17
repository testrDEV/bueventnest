# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

events = [
  {:name => 'HackBU', :description => 'Come learn about HackBU and the various activities we will be doing.', :location => 'Binghamton', :start_date => '2020-05-20', :end_date => '2020-05-20', :contact => '123456', :seats => 4},
  {:name => 'Party', :description => 'Come learn about the events hosted in Vestal mall', :location => 'Vestal', :start_date => '2020-05-21', :end_date => '2020-05-22', :contact => '98765', :seats => 2},
  ]
  
  

events.each do |event|
  Event.create!(event)
end