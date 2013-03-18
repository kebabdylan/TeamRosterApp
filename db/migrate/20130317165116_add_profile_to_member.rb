class AddProfileToMember < ActiveRecord::Migration
  def change
    add_column :members, :profile, :string
  end
end
