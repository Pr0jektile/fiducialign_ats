class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users, id: :uuid do |t|
      t.references :tenant, null: false, foreign_key: true, type: :uuid
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :role
      t.boolean :is_active

      t.timestamps
    end
  end
end
