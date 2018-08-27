class AddDisplayToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_column :departments, :display, :integer
  end
end
