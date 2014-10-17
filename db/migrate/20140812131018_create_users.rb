class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :description
      t.string :avatar
      t.date :joined_on
      t.integer :group_id
      t.integer :role_id
      t.integer :office_id

      t.timestamps
    end
  end
end
