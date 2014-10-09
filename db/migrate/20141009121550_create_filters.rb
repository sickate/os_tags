class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :project_id
      t.integer :office_id
      t.integer :role_id

      t.timestamps
    end
  end
end
