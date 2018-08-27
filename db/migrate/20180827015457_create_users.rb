class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.references :department, foreign_key: true
      t.integer :extension_number
      t.string :password_digest

      t.timestamps
    end
  end
end
