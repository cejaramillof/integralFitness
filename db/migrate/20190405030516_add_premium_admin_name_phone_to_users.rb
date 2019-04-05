class AddPremiumAdminNamePhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :premium, :date
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :name, :string
    add_column :users, :phone, :string
  end
end
