class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.text :bio

      t.timestamps null: false
    end
  end
end
