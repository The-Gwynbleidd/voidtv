class AddSlugToNetworks < ActiveRecord::Migration
  def change
    add_column :networks, :slug, :string
  end
end
