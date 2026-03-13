class CreateTenants < ActiveRecord::Migration[8.1]
  def change
    create_table :tenants, id: :uuid do |t|
      t.string :name
      t.boolean :is_active

      t.timestamps
    end
  end
end
