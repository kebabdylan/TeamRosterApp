class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.references :team
      t.references :member
      t.references :role

      t.timestamps
    end
    add_index :rosters, :team_id
    add_index :rosters, :member_id
    add_index :rosters, :role_id
  end
end
