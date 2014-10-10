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

offices.each_with_index do |name, index|
  city = City.create(name: name, timezone: timezones[index])
  office = Office.create(city_id: city.id)
end
puts 'Offices are created!'

asg_projects = ['United Airlines', 'AIG', 'Citi', 'Nielson']
asg_projects.each do |name|
  asg = Group.first
  asg.projects << Project.create(name: name)
end


hc_projects = ['Health Project A']
hc_projects.each do |name|
  Group.all[1].projects << Project.create(name: name)
end
puts 'Projects are created!'

Group.all.each do |g|
  g.offices << Office.all
end

nj_office = Office.at_location('New Jersey')
nj_office.projects << Project.all

sh_office = Office.at_location('Shanghai')
sh_office.projects << Project.all

sd_office = Office.at_location('San Diego')
sd_office.projects << Project.all.last(3)

spm_role = Role.create(name: 'Senior PM')
se_role = Role.create(name: 'Software Engineer')
sm_role = Role.create(name: 'Software Manager')

tom = User.create(name: 'Tom Cat', avatar: 'tom', role_id: sm_role.id, office_id: sd_office.id, email: 'tcat@operasolutions.com', group_id: 1, joined_on: Date.parse('20110903'))
tuo = User.create(name: 'Tuo Zhu', avatar: 'tuo', role_id: se_role.id, office_id: sh_office.id, email: 'tuo.zhu@operasolutions.com', group_id: 1, joined_on: Date.parse('20071003'))
jerry = User.create(name: 'Jerry Mouse', avatar: 'jerry', role_id: spm_role.id, office_id: nj_office.id, email: 'jmouse@operasolutions.com', group_id: 1, joined_on: Date.parse('20130203'))

tom.current_projects << Project.first
tom.skill_list = ['Python', 'Vektor', 'Pentaho', 'Hadoop']
jerry.current_projects << Project.all[1]
jerry.skill_list = ['Python', 'Java', 'Hadoop', 'Pig']
tuo.current_projects << Project.all[2]
tuo.skill_list = ['Python', 'Java', 'Ruby', 'Hbase']
tom.save
tuo.save
jerry.save
