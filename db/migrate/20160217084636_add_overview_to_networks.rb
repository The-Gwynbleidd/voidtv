class AddOverviewToNetworks < ActiveRecord::Migration
  def change
    add_column :networks, :overview, :text
  end
end
