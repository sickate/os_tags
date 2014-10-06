# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  description :text
#  avatar      :string(255)
#  group_id    :integer
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
  acts_as_taggable_on :skills, :clients, :prospects, :tags

  has_and_belongs_to_many :histroy_projects, join_table: "users_projects_histroy", class_name: 'Project'
  has_and_belongs_to_many :current_projects, join_table: "users_projects_current", class_name: 'Project'

  belongs_to :group
  belongs_to :office

  def self.search(search)
    User.where("name LIKE  ? OR email like ?", "%#{search}%","%#{search}%")
  end
end
