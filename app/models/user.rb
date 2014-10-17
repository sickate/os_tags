# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  description :text
#  avatar      :string(255)
#  joind_on    :date
#  group_id    :integer
#  role_id     :integer
#  office_id   :integer
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_taggable_on :skills, :clients, :prospects, :tags

  has_and_belongs_to_many :histroy_projects, join_table: "users_projects_histroy", class_name: 'Project'
  has_and_belongs_to_many :current_projects, join_table: "users_projects_current", class_name: 'Project'

  belongs_to :group
  belongs_to :office
  belongs_to :role

  scope :in_office, -> (office) {
    if office.nil?
      all
    else
      where(office_id: office.id)
    end
  }

 scope :of_role, -> (role) {
    if role.nil?
      all
    else
      where(role_id: role.id)
    end
  }


  scope :of_group, -> (group) {
    if group.nil?
      all
    else
      where(group_id: group.id)
    end
  }

  scope :on_project, -> (project) {
    if project.nil?
      all
    else
      joins('left outer join users_projects_current on users_projects_current.user_id = users.id').where('users_projects_current.project_id = ?', project.id)
    end
  }

  def self.search(search)
    User.where("name LIKE  ? OR email like ?", "%#{search}%","%#{search}%")
  end

end
