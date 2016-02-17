class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :fullname
      t.text :bio
      t.text :overview
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
