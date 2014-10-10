# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  status      :string(255)
#  description :text
#  group_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
  has_and_belongs_to_many :offices, join_table: "offices_projects"

  has_many :people, class_name: 'User'

  belongs_to :group

  scope :in_office, -> (office) {
      if office.nil?
        all
      else
        joins('left outer join offices_projects on offices_projects.project_id = projects.id').where('offices_projects.office_id = ?', office.id)
      end
    }
end
