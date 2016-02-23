class AddCountryToNetwork < ActiveRecord::Migration
  def change
    add_reference :networks, :country, index: true, foreign_key: true
  end
end
