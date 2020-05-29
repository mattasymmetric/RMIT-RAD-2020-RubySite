class AddLastloginToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastlogin, :datetime
  end
end
