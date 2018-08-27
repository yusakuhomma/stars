class CreateHaveskills < ActiveRecord::Migration[5.0]
  def change
    create_table :haveskills do |t|
      t.integer :assessment
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
