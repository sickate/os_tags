class CreateUsersProjectsHistroy < ActiveRecord::Migration
  def change
    create_table :users_projects_histroy do |t|
      t.integer :user_id
      t.integer :project_id
    end
  end
end
