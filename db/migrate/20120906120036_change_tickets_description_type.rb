class ChangeTicketsDescriptionType < ActiveRecord::Migration
  def up
    change_table :tickets do |t|
      t.change :description, :text
    end
  end

  def down
    change_table :tickets do |t|
      t.change :description, :string
    end
  end
end
