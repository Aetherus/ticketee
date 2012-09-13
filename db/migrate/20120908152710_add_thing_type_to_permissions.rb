class AddThingTypeToPermissions < ActiveRecord::Migration
  def change
    change_table :permissions do |t|
      t.string :thing_type
    end
  end
end
