class AddSlugToActors < ActiveRecord::Migration
  def change
    add_column :actors, :slug, :string
  end
end
