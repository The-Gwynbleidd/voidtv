class AddAttachmentLogoToNetworks < ActiveRecord::Migration
  def self.up
    change_table :networks do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :networks, :logo
  end
end
