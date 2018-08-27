class AddDisplayToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :display, :integer
  end
end
