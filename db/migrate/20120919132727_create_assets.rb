class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.belongs_to :ticket
      t.has_attached_file :asset
      t.timestamps
    end

    remove_attachment :tickets, :asset
  end
end
