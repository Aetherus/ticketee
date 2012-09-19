class AddAttachmentAssetToTickets < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      # This statement will add FOUR columns to the tickets table:
      # asset_file_name: string
      # asset_content_type: string
      # asset_file_size: integer
      # asset_updated_at: datetime
      t.has_attached_file :asset
    end
  end

  def self.down
    drop_attached_file :tickets, :asset
  end
end
