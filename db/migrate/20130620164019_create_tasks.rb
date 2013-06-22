class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :project
      t.string :name
      t.date :deadline
      t.boolean :finish, default: false, null: false
      t.integer :priority, :integer, default: 1
      t.timestamps
    end
    add_index :tasks, :project_id
  end
end
