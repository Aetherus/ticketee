class AddAuthenticableFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      # Token authenticatable
      t.string :authentication_token
    end
  end
end
