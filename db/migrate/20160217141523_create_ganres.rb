class CreateGanres < ActiveRecord::Migration
  def change
    create_table :ganres do |t|
      t.string :name
      t.text :description
      t.string :slug

      t.timestamps null: false
    end
  end
end
