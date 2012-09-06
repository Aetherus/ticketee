class AddUserReferenceToTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.belongs_to :user
    end
  end
end
