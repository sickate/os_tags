# == Schema Information
#
# Table name: offices
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Office < ActiveRecord::Base
  has_and_belongs_to_many :projects, :join_table => "offices_projects"
  has_and_belongs_to_many :groups, :join_table => "groups_projects"

  has_many :people, :class_name => 'User'

  belongs_to :city
end
