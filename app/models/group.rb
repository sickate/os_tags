# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  has_and_belongs_to_many :offices, :join_table => "groups_offices"

  has_many :people, class_name: 'User'
  has_many :projects
end
