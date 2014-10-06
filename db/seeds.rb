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

offices = ['New Jersey', 'San Diego', 'Shanghai', 'Delhi', 'London']
timezones = ['EDT', 'PDT', 'CST', 'IST', 'BST']

offices.each_with_index do |name, index|
  city = City.create(name: name, timezone: timezones[index])
  Office.create(city_id: city.id)
end
