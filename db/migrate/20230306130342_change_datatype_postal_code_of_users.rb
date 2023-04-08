class ChangeDatatypePostalCodeOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :postal_code, :integer
  end
end
