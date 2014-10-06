class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.text :description
      t.integer :group_id

      t.timestamps
    end
  end
end
