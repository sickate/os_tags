class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :description
      t.string :avatar
      t.integer :group_id
      t.integer :project_id

      t.timestamps
    end
  end
end
