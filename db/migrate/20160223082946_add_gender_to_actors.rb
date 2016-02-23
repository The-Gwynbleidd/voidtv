class AddGenderToActors < ActiveRecord::Migration
  def change
    add_column :actors, :gender, :string
  end
end
