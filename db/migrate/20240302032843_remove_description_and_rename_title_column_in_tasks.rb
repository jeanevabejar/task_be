class RemoveDescriptionAndRenameTitleColumnInTasks < ActiveRecord::Migration[7.1]
  def change
      # Remove the 'description' column from the 'tasks' table
      remove_column :tasks, :description, :string

      # Rename the 'title' column to 'todo' in the 'tasks' table
      rename_column :tasks, :title, :todo
  end
end
