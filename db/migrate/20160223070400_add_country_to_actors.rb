class AddCountryToActors < ActiveRecord::Migration
  def change
    add_reference :actors, :country, index: true, foreign_key: true
  end
end
