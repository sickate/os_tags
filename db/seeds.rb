# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
groups = ['Advanced Solutions',  'Health Care']
groups.each do |name|
  Group.create(name: name)
end

puts 'Groups are created!'

offices = ['New Jersey', 'San Diego', 'Shanghai', 'Delhi', 'London']
timezones = ['EDT', 'PDT', 'CST', 'IST', 'BST']

offices.each_with_index do |index, name|
  city = City.create(name: name, timezone: timezones[index])
  office = Office.create(city_id: city.id)
end
puts 'Offices are created!'

Group.all.each do |g|
  g.offices << Office.all
end

