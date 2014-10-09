class CreateUsersProjectsCurrent < ActiveRecord::Migration
  def change
    create_table :users_projects_current do |t|
      t.integer :user_id
      t.integer :project_id
    end
  end
end
