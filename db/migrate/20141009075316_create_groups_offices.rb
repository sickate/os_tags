class CreateGroupsOffices < ActiveRecord::Migration
  def change
    create_table :groups_offices do |t|
      t.integer :group_id
      t.integer :office_id
    end
  end
end
