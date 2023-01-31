class AddPostalCodeAddressIntroductionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :text
    add_column :users, :address, :text
    add_column :users, :introduction, :text
  end
end
