class ChangeDataTypeOfAddress < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :address, :string
  end
end
