class CreateGroupsProjects < ActiveRecord::Migration
  def change
    create_table :groups_projects do |t|
      t.integer :group_id
      t.integer :project_id
    end
  end
end
