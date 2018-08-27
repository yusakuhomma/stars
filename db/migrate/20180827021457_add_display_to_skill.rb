class AddDisplayToSkill < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :display, :integer
  end
end
