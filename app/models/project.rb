# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  group_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
  has_and_belongs_to_many :offices, join_table: "offices_projects"

  belongs_to :group
end
