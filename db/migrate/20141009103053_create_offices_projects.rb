class CreateOfficesProjects < ActiveRecord::Migration
  def change
    create_table :offices_projects do |t|
      t.integer :office_id
      t.integer :project_id
    end
  end
end
