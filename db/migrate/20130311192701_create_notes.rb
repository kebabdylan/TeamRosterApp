class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.boolean :is_private
      t.references :project

      t.timestamps
    end
    add_index :notes, :project_id
  end
end
